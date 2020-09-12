CREATE TYPE "skill_level" AS ENUM (
  'beginner',
  'intermediate',
  'expert',
  'advanced'
);

CREATE TABLE "jobpost" (
  "id" SERIAL PRIMARY KEY,
  "role" varchar,
  "job_type_id" int,
  "location" varchar,
  "tags" varchar,
  "description" varchar,
  "exp_required" int,
  "company_id" int,
  "link_to_apply" varchar,
  "email" varchar,
  "ctc_per_year" float8,
  "ctc_range_start" float8,
  "ctc_range_end" float8,
  "hourly_rate" float8,
  "created_at" timestamp,
  "updated_at" timestamp
);

CREATE TABLE "job_type" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "jobpost_skill" (
  "id" SERIAL PRIMARY KEY,
  "jobpost_id" int,
  "skill_id" int
);

CREATE TABLE "user" (
  "id" SERIAL PRIMARY KEY,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "is_admin" boolean,
  "user_type" varchar,
  "phone_no" int,
  "gender" varchar,
  "heighest_education" varchar,
  "created_at" timestamp,
  "current_ctc" int,
  "expected_ctc" int,
  "notice_period" varchar,
  "resume" blob,
  "website" varchar,
  "github" varchar,
  "linkedin" varchar,
  "preferred_location" varchar,
  "total_experience" int,
  "age" int
);

CREATE TABLE "user_employer" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "employer_id" int,
  "is_current_employer" boolean,
  "designation" varchar,
  "start_date" datetime,
  "end_date" datetime,
  "key_job_responsibilities" varchar
);

CREATE TABLE "user_employer_project" (
  "id" SERIAL PRIMARY KEY,
  "user_employer_id" int,
  "name" varchar,
  "description" varchar,
  "start_date" datetime,
  "end_date" datetime,
  "team_size" int
);

CREATE TABLE "user_employer_project_skill" (
  "id" SERIAL PRIMARY KEY,
  "user_employer_project_id" int,
  "skill_id" int
);

CREATE TABLE "company" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "logo" blob,
  "website" varchar
);

CREATE TABLE "skill" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "user_skill" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "skill_id" int,
  "level" skill_level,
  "last_used" varchar
);

CREATE TABLE "certifcation" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "description" varchar,
  "certifying_body" varchar
);

CREATE TABLE "user_certification" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "certifcation_id" int
);

CREATE TABLE "education" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "stream" varchar
);

CREATE TABLE "user_education" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "education_id" int,
  "is_current_education" boolean,
  "start_date" datetime,
  "end_date" datetime,
  "percentage" float8,
  "institute_id" int,
  "specialization" varchar
);

CREATE TABLE "education_institute" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar,
  "university" varchar
);

ALTER TABLE "jobpost" ADD FOREIGN KEY ("job_type_id") REFERENCES "job_type" ("id");

ALTER TABLE "jobpost" ADD FOREIGN KEY ("company_id") REFERENCES "company" ("id");

ALTER TABLE "jobpost_skill" ADD FOREIGN KEY ("jobpost_id") REFERENCES "jobpost" ("id");

ALTER TABLE "jobpost_skill" ADD FOREIGN KEY ("skill_id") REFERENCES "skill" ("id");

ALTER TABLE "user_employer" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_employer" ADD FOREIGN KEY ("employer_id") REFERENCES "company" ("id");

ALTER TABLE "user_employer_project" ADD FOREIGN KEY ("user_employer_id") REFERENCES "user_employer" ("id");

ALTER TABLE "user_employer_project_skill" ADD FOREIGN KEY ("user_employer_project_id") REFERENCES "user_employer_project" ("id");

ALTER TABLE "user_employer_project_skill" ADD FOREIGN KEY ("skill_id") REFERENCES "skill" ("id");

ALTER TABLE "user_skill" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_skill" ADD FOREIGN KEY ("skill_id") REFERENCES "skill" ("id");

ALTER TABLE "user_certification" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_certification" ADD FOREIGN KEY ("certifcation_id") REFERENCES "certifcation" ("id");

ALTER TABLE "user_education" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_education" ADD FOREIGN KEY ("education_id") REFERENCES "education" ("id");

ALTER TABLE "user_education" ADD FOREIGN KEY ("institute_id") REFERENCES "education_institute" ("id");

ALTER TABLE "user_skill" ADD FOREIGN KEY ("id") REFERENCES "user_skill" ("user_id");
