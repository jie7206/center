CREATE TABLE XP_PROC 
-- This table created by osenxpsuite2009
-- Created date: 2009/8/23 下午 08:25:09
(
      view_name    TEXT,
      param_list   TEXT,
      xSQL         TEXT,
      def_param    TEXT,
      opt_param    TEXT,
      comment      TEXT,
      PRIMARY KEY (
        view_name
      )
);
CREATE TABLE "accounts" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "username" varchar(255), "password" varchar(255), "role" varchar(255), "is_accountant" boolean, "hash_key" varchar(255));
CREATE TABLE "activities" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "begin_date" date, "end_date" date, "place" varchar(255), "people_count" integer, "manager" varchar(255), "teachers" varchar(255), "students" text, "achievement" text, "criticism" text, "expect_people_count" integer, "method_and_goal" text, "is_achievement" boolean, "picture_folder_name" varchar(255));
CREATE TABLE "asset_item_detail_catalogs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "order_num" integer);
CREATE TABLE "asset_item_details" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "asset_item_id" integer, "accounting_date" date, "title" varchar(255), "change_amount" decimal, "balance" decimal, "created_at" datetime, "updated_at" datetime, "asset_item_detail_catalog_id" integer, "note" text);
CREATE TABLE "asset_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "asset_id" integer, "title" varchar(255), "currency" varchar(255), "created_at" datetime, "updated_at" datetime, "memo" text, "amount" decimal, "asset_belongs_to_id" integer, "is_emergency" boolean, "is_save_for_goal" boolean, "ntd_amount" integer, "loan_begin_date" datetime, "loan_interest_rate" decimal);
CREATE TABLE "assets" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "title" varchar(255), "code" varchar(255));
CREATE TABLE "courses" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "status_id" integer, "title" varchar(255), "order_num" integer, "url_link" varchar(255), "created_at" datetime, "updated_at" datetime, "points" integer);
CREATE TABLE "donations" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "catalog_id" integer, "accounting_date" date, "title" varchar(255), "amount" decimal, "note" text, "created_at" datetime, "updated_at" datetime);
CREATE TABLE "histories" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "class_date" date, "class_teacher" varchar(255), "class_title" varchar(255), "class_feel" text, "name" varchar(255), "score" integer, "is_passed" boolean, "points" integer, "class_type" varchar(255), "area_id" integer, "is_public_class" boolean);
CREATE TABLE "life_catalogs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "order_num" integer, "weight" decimal, "chartable" boolean, "goalable" boolean, "total_minutes" integer, "line_order_num" integer, "goal_minutes" integer);
CREATE TABLE "life_goals" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "param_id" integer, "title" varchar(255), "minutes" integer, "resource_url" varchar(255), "is_pass" boolean, "pass_date" date, "order_num" integer, "completed_minutes" integer, "is_todo" boolean, "begin_time" varchar(255), "end_time" varchar(255), "is_show" boolean);
CREATE TABLE "life_items" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "created_at" datetime, "updated_at" datetime, "life_catalog_id" integer, "total_minutes" integer, "is_not_chart" boolean, "is_goal" boolean, "goal_minutes" integer, "order_num" integer, "begin_date" varchar(255), "end_date" varchar(255), "main_content" text, "main_goal" text, "total_days" integer, "is_finished" boolean);
CREATE TABLE "life_records" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "life_item_id" integer, "rec_date" varchar(255), "created_at" datetime, "updated_at" datetime, "used_minutes" integer, "memo" text, "is_not_goal" boolean);
CREATE TABLE "member_reports" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "area_id" integer, "rec_date" date, "family_count" integer, "student_member_count" integer, "worker_member_count" integer, "generation2_1_count" integer, "generation2_2_count" integer, "student_new_count" integer, "worker_new_count" integer, "blessedable_count" integer, "leader_count" integer, "staff_count" integer, "created_at" datetime, "updated_at" datetime, "m_core_student" integer, "m_core_young" integer, "m_core_adult" integer, "m_new_student" integer, "m_new_young" integer, "m_new_adult" integer, "m_normal_student" integer, "m_normal_young" integer, "m_normal_adult" integer, "f_core_student" integer, "f_core_young" integer, "f_core_adult" integer, "f_new_student" integer, "f_new_young" integer, "f_new_adult" integer, "f_normal_student" integer, "f_normal_young" integer, "f_normal_adult" integer, "m_core_college" integer, "m_new_college" integer, "m_normal_college" integer, "f_core_college" integer, "f_new_college" integer, "f_normal_college" integer);
CREATE TABLE "members" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "sex" varchar(255), "mobile" varchar(255), "birthday" date, "email" varchar(255), "career" varchar(255), "picture" varchar(255), "created_at" datetime, "updated_at" datetime, "classification" varchar(255), "is_team_leader" boolean, "birthday_still_unknow" boolean, "memo" text, "conductor_id" integer, "introducer_id" integer, "school" varchar(255), "is_on_table" boolean, "interest" varchar(255), "order_num" integer, "pray_note" text, "area_id" integer, "is_core_leader" boolean, "is_staff" boolean, "spouse_id" integer, "sex_id" integer, "admin_only" boolean, "blessedable" boolean, "is_teacher" boolean, "educational_background" varchar(255), "occupation" varchar(255), "blessing_number" integer, "father_id" int, "is_core_family" boolean, "english_name" varchar(255), "is_college" boolean, "is_2g" boolean);
CREATE TABLE "param_changes" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "param_id" integer, "title" varchar(255), "change_value" decimal, "value" decimal, "created_at" datetime, "updated_at" datetime, "rec_date" date, "is_enjoy" boolean);
CREATE TABLE "params" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "value" varchar(255), "title" varchar(255), "content" text, "rec_change" boolean, "order_num" integer);
CREATE TABLE "pay_logs" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "title" varchar(255), "amount" decimal, "is_received" boolean, "created_at" datetime, "updated_at" datetime, "manager" varchar(255));
CREATE TABLE "questions" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "to_name" varchar(255), "title" varchar(255), "catalog" varchar(255), "description" text, "solution" text, "is_solved" boolean, "created_at" datetime, "updated_at" datetime, "member_id" integer, "is_secret" boolean);
CREATE TABLE "schema_migrations" ("version" varchar(255) NOT NULL);
CREATE TABLE "sim_characters" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "sex" integer, "birthday" date, "identity" varchar(255), "intelligence_p" integer, "sprit_p" integer, "willpower_p" integer, "seek_truth_p" integer, "seek_love_p" integer, "seek_dream_p" integer, "express_p" integer, "coaching_p" integer, "leadership_p" integer, "created_at" datetime, "updated_at" datetime, "will_comein_p" integer, "parent_id" integer, "school_name" varchar(255), "school_major" varchar(255), "educational_background_num" integer, "occupation_num" integer, "blessing_num" integer, "spouse_id" integer, "photo" varchar(255), "log" text);
CREATE TABLE "steps" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "name" varchar(255), "order_num" integer, "memo" text, "created_at" datetime, "updated_at" datetime, "status_id" integer);
CREATE TABLE "traces" ("id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, "member_id" integer, "status_num" integer, "last_class_date" date, "last_class_title" varchar(255), "next_class_date" date, "next_class_title" varchar(255), "created_at" datetime, "updated_at" datetime, "last_class_teacher" varchar(255), "next_class_teacher" varchar(255), "class_feel" text, "appointment_promise" boolean, "star_level" varchar(255), "score" integer, "is_passed" boolean, "points" integer, "appointment_made" boolean, "step_ids" text, "class_type" varchar(255), "aid" integer, "is_public_class" boolean);
CREATE UNIQUE INDEX "unique_schema_migrations" ON "schema_migrations" ("version");
INSERT INTO schema_migrations (version) VALUES ('0');

INSERT INTO schema_migrations (version) VALUES ('20090822003733');

INSERT INTO schema_migrations (version) VALUES ('20090822234854');

INSERT INTO schema_migrations (version) VALUES ('20090823000459');

INSERT INTO schema_migrations (version) VALUES ('20090823000819');

INSERT INTO schema_migrations (version) VALUES ('20090823110843');

INSERT INTO schema_migrations (version) VALUES ('20090823114020');

INSERT INTO schema_migrations (version) VALUES ('20090823122219');

INSERT INTO schema_migrations (version) VALUES ('20090824005455');

INSERT INTO schema_migrations (version) VALUES ('20090824010856');

INSERT INTO schema_migrations (version) VALUES ('20090824124531');

INSERT INTO schema_migrations (version) VALUES ('20090824214919');

INSERT INTO schema_migrations (version) VALUES ('20090826002903');

INSERT INTO schema_migrations (version) VALUES ('20090826031845');

INSERT INTO schema_migrations (version) VALUES ('20090826082818');

INSERT INTO schema_migrations (version) VALUES ('20090826083856');

INSERT INTO schema_migrations (version) VALUES ('20090826115648');

INSERT INTO schema_migrations (version) VALUES ('20090826122359');

INSERT INTO schema_migrations (version) VALUES ('20090827000914');

INSERT INTO schema_migrations (version) VALUES ('20090827033117');

INSERT INTO schema_migrations (version) VALUES ('20090827235338');

INSERT INTO schema_migrations (version) VALUES ('20090828110653');

INSERT INTO schema_migrations (version) VALUES ('20090829003141');

INSERT INTO schema_migrations (version) VALUES ('20090830005850');

INSERT INTO schema_migrations (version) VALUES ('20090830212332');

INSERT INTO schema_migrations (version) VALUES ('20090830213502');

INSERT INTO schema_migrations (version) VALUES ('20100412051023');

INSERT INTO schema_migrations (version) VALUES ('20100420024832');

INSERT INTO schema_migrations (version) VALUES ('20100420055945');

INSERT INTO schema_migrations (version) VALUES ('20100617061925');

INSERT INTO schema_migrations (version) VALUES ('20100617080420');

INSERT INTO schema_migrations (version) VALUES ('20100623035903');

INSERT INTO schema_migrations (version) VALUES ('20100623040150');

INSERT INTO schema_migrations (version) VALUES ('20100623064112');

INSERT INTO schema_migrations (version) VALUES ('20100623071436');

INSERT INTO schema_migrations (version) VALUES ('20100624013042');

INSERT INTO schema_migrations (version) VALUES ('20100624013105');

INSERT INTO schema_migrations (version) VALUES ('20100624014739');

INSERT INTO schema_migrations (version) VALUES ('20100624123835');

INSERT INTO schema_migrations (version) VALUES ('20100624123949');

INSERT INTO schema_migrations (version) VALUES ('20100624135437');

INSERT INTO schema_migrations (version) VALUES ('20100625061413');

INSERT INTO schema_migrations (version) VALUES ('20100628011752');

INSERT INTO schema_migrations (version) VALUES ('20100628102817');

INSERT INTO schema_migrations (version) VALUES ('20100630230933');

INSERT INTO schema_migrations (version) VALUES ('20100702005027');

INSERT INTO schema_migrations (version) VALUES ('20100702014305');

INSERT INTO schema_migrations (version) VALUES ('20100702025911');

INSERT INTO schema_migrations (version) VALUES ('20100702032901');

INSERT INTO schema_migrations (version) VALUES ('20100703072052');

INSERT INTO schema_migrations (version) VALUES ('20100703073442');

INSERT INTO schema_migrations (version) VALUES ('20100704123736');

INSERT INTO schema_migrations (version) VALUES ('20100707083322');

INSERT INTO schema_migrations (version) VALUES ('20100708013259');

INSERT INTO schema_migrations (version) VALUES ('20100721014914');

INSERT INTO schema_migrations (version) VALUES ('20100723060129');

INSERT INTO schema_migrations (version) VALUES ('20100817222521');

INSERT INTO schema_migrations (version) VALUES ('20100818040548');

INSERT INTO schema_migrations (version) VALUES ('20100912225331');

INSERT INTO schema_migrations (version) VALUES ('20101102062628');

INSERT INTO schema_migrations (version) VALUES ('20130613010524');

INSERT INTO schema_migrations (version) VALUES ('20130613013157');

INSERT INTO schema_migrations (version) VALUES ('20130613014945');

INSERT INTO schema_migrations (version) VALUES ('20130614234225');

INSERT INTO schema_migrations (version) VALUES ('20141029083421');

INSERT INTO schema_migrations (version) VALUES ('20141030074001');

INSERT INTO schema_migrations (version) VALUES ('20141030080848');

INSERT INTO schema_migrations (version) VALUES ('20141030084834');

INSERT INTO schema_migrations (version) VALUES ('20141031031823');

INSERT INTO schema_migrations (version) VALUES ('20141102100807');

INSERT INTO schema_migrations (version) VALUES ('20141102102818');

INSERT INTO schema_migrations (version) VALUES ('20141103080533');

INSERT INTO schema_migrations (version) VALUES ('20141104071201');

INSERT INTO schema_migrations (version) VALUES ('20141104113048');

INSERT INTO schema_migrations (version) VALUES ('20141105102501');

INSERT INTO schema_migrations (version) VALUES ('20141108143928');

INSERT INTO schema_migrations (version) VALUES ('20141108145505');

INSERT INTO schema_migrations (version) VALUES ('20141111063721');

INSERT INTO schema_migrations (version) VALUES ('20141115023821');

INSERT INTO schema_migrations (version) VALUES ('20141122012455');

INSERT INTO schema_migrations (version) VALUES ('20141124034728');

INSERT INTO schema_migrations (version) VALUES ('20141124060651');

INSERT INTO schema_migrations (version) VALUES ('20141124090439');

INSERT INTO schema_migrations (version) VALUES ('20141205040108');

INSERT INTO schema_migrations (version) VALUES ('20141212085853');

INSERT INTO schema_migrations (version) VALUES ('20141214132822');

INSERT INTO schema_migrations (version) VALUES ('20141214140914');

INSERT INTO schema_migrations (version) VALUES ('20141215092821');

INSERT INTO schema_migrations (version) VALUES ('20141215120320');

INSERT INTO schema_migrations (version) VALUES ('20141218001831');

INSERT INTO schema_migrations (version) VALUES ('20141218011507');

INSERT INTO schema_migrations (version) VALUES ('20141221114032');

INSERT INTO schema_migrations (version) VALUES ('20141229000001');

INSERT INTO schema_migrations (version) VALUES ('20150107020944');

INSERT INTO schema_migrations (version) VALUES ('20150107123915');

INSERT INTO schema_migrations (version) VALUES ('20150113080459');

INSERT INTO schema_migrations (version) VALUES ('20150114095314');

INSERT INTO schema_migrations (version) VALUES ('20150115020800');

INSERT INTO schema_migrations (version) VALUES ('20150123125226');

INSERT INTO schema_migrations (version) VALUES ('20150124084313');

INSERT INTO schema_migrations (version) VALUES ('20150209114503');

INSERT INTO schema_migrations (version) VALUES ('20150504090118');

INSERT INTO schema_migrations (version) VALUES ('20150504115946');

INSERT INTO schema_migrations (version) VALUES ('20150504120501');

INSERT INTO schema_migrations (version) VALUES ('20150504121114');

INSERT INTO schema_migrations (version) VALUES ('20150505032909');

INSERT INTO schema_migrations (version) VALUES ('20150514075840');

INSERT INTO schema_migrations (version) VALUES ('20150820114825');

INSERT INTO schema_migrations (version) VALUES ('20160225015450');

INSERT INTO schema_migrations (version) VALUES ('20160225044357');

INSERT INTO schema_migrations (version) VALUES ('20160225045331');

INSERT INTO schema_migrations (version) VALUES ('20160227000809');

INSERT INTO schema_migrations (version) VALUES ('20160229131431');

INSERT INTO schema_migrations (version) VALUES ('20160301120904');

INSERT INTO schema_migrations (version) VALUES ('20160301141737');

INSERT INTO schema_migrations (version) VALUES ('20160301142609');

INSERT INTO schema_migrations (version) VALUES ('20160305133809');