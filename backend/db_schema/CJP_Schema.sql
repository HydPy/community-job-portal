CREATE TYPE "skill_level" AS ENUM (
  'beginner',
  'intermediate',
  'expert',
  'advanced'
);

CREATE TABLE "jobpost" (
  "id" SERIAL PRIMARY KEY,
  "role" varchar,
  "location" varchar,
  "tags" varchar,
  "description" varchar,
  "exp_required" int,
  "company_name" int,
  "link_to_apply" varchar,
  "email" varchar
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
  "resume" varchar,
  "preferred_location" varchar,
  "age" int
);

CREATE TABLE "user_employer" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "employer_id" int,
  "is_current_employer" boolean,
  UNIQUE (user_id, employer_id)
);

CREATE TABLE "company" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
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
  "last_used" varchar,
  UNIQUE (user_id, skill_id)
);

CREATE TABLE "education" (
  "id" SERIAL PRIMARY KEY,
  "name" varchar
);

CREATE TABLE "user_education" (
  "id" SERIAL PRIMARY KEY,
  "user_id" int,
  "employer_id" int,
  "is_current_education" boolean,
  UNIQUE (user_id, employer_id),
  UNIQUE (user_id, is_current_education)
);

ALTER TABLE "jobpost" ADD FOREIGN KEY ("company_name") REFERENCES "company" ("id");

ALTER TABLE "jobpost_skill" ADD FOREIGN KEY ("jobpost_id") REFERENCES "jobpost" ("id");

ALTER TABLE "jobpost_skill" ADD FOREIGN KEY ("skill_id") REFERENCES "skill" ("id");

ALTER TABLE "user_employer" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_employer" ADD FOREIGN KEY ("employer_id") REFERENCES "company" ("id");

ALTER TABLE "user_skill" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_skill" ADD FOREIGN KEY ("skill_id") REFERENCES "skill" ("id");

ALTER TABLE "user_education" ADD FOREIGN KEY ("user_id") REFERENCES "user" ("id");

ALTER TABLE "user_education" ADD FOREIGN KEY ("employer_id") REFERENCES "education" ("id");

ALTER TABLE "user_skill" ADD FOREIGN KEY ("id") REFERENCES "user_skill" ("user_id");
