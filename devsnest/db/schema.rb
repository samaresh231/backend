# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.


ActiveRecord::Schema.define(version: 2021_01_15_133157) do

  create_table "Chapters", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.integer "priority", null: false
    t.json "metaData"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "curriculumId", unsigned: true
    t.index ["curriculumId"], name: "curriculumId"
    t.index ["id"], name: "id", unique: true
    t.index ["slug"], name: "chapters_slug", unique: true
  end

  create_table "Curriculums", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.text "url"
    t.string "slug", null: false
    t.string "duration", null: false
    t.integer "priority", null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["id"], name: "id", unique: true
    t.index ["slug"], name: "curriculums_slug", unique: true
  end

  create_table "Gbus", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "description", null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "userId", unsigned: true
    t.index ["id"], name: "id", unique: true
    t.index ["userId"], name: "userId"
  end

  create_table "MenteeFeedbacks", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "feedback"
    t.column "understanding", "enum('GREEN','YELLOW','RED')"
    t.column "effort", "enum('GREEN','YELLOW','RED')"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "userId", unsigned: true
    t.integer "menteeId", unsigned: true
    t.index ["id"], name: "id", unique: true
    t.index ["menteeId"], name: "menteeId"
    t.index ["userId"], name: "userId"
  end

  create_table "MentorFeedbacks", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "feedback"
    t.column "capability", "enum('GREEN','YELLOW','RED')"
    t.column "timeGiven", "enum('GREEN','YELLOW','RED')"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "userId", unsigned: true
    t.integer "mentorId", unsigned: true
    t.index ["id"], name: "id", unique: true
    t.index ["mentorId"], name: "mentorId"
    t.index ["userId"], name: "userId"
  end

  create_table "Mentors", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "mentorId", unsigned: true
    t.integer "menteeId", unsigned: true
    t.index ["id"], name: "id", unique: true
    t.index ["menteeId"], name: "menteeId"
    t.index ["mentorId"], name: "mentorId"
  end

  create_table "ProgressChapters", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.column "status", "enum('DONE','UNDONE')", default: "UNDONE"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "chapterId", unsigned: true
    t.integer "userId", unsigned: true
    t.index ["chapterId"], name: "chapterId"
    t.index ["id"], name: "id", unique: true
    t.index ["userId"], name: "userId"
  end

  create_table "ProgressCurriculums", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.column "status", "enum('DONE','UNDONE')", default: "UNDONE"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "curriculumId", unsigned: true
    t.integer "userId", unsigned: true
    t.index ["curriculumId"], name: "curriculumId"
    t.index ["id"], name: "id", unique: true
    t.index ["userId"], name: "userId"
  end

  create_table "ProgressTasks", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.column "status", "enum('DONE','UNDONE')", default: "UNDONE"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "taskId", unsigned: true
    t.integer "userId", unsigned: true
    t.index ["id"], name: "id", unique: true
    t.index ["taskId"], name: "taskId"
    t.index ["userId"], name: "userId"
  end

  create_table "Projects", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "description", null: false
    t.string "techStack"
    t.string "videoLink"
    t.string "githubLink"
    t.string "hostedURL"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "userId", unsigned: true
    t.index ["id"], name: "id", unique: true
    t.index ["userId"], name: "userId"
  end

  create_table "Tasks", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", null: false
    t.string "slug", null: false
    t.string "url", null: false
    t.column "type", "enum('TUTORIAL','QUESTION','VIDEO')"
    t.integer "priority", null: false
    t.json "metaData"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.integer "curriculumId", unsigned: true
    t.integer "chapterId", unsigned: true
    t.index ["chapterId"], name: "chapterId"
    t.index ["curriculumId"], name: "curriculumId"
    t.index ["id"], name: "id", unique: true
    t.index ["slug"], name: "tasks_slug", unique: true
  end

  create_table "Users", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "username", null: false
    t.string "profileImage"
    t.string "name", null: false
    t.string "email", null: false
    t.string "passwordHash", null: false
    t.string "passwordResetHash"
    t.json "jsonData"
    t.string "aboutMe"
    t.string "github"
    t.string "linkedIn"
    t.string "institution"
    t.column "batch", "enum('Batch 1','Batch 2')"
    t.column "jobStatus", "enum('Placed','looking for jobs')"
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["id"], name: "id", unique: true
  end

  create_table "contents", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "unique_id"
    t.string "parent_id"
    t.string "name"
    t.integer "data_type"
    t.string "link"
    t.integer "priority"
    t.boolean "extra"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false

    t.integer "score"
    t.index ["parent_id"], name: "index_contents_on_parent_id"
    t.index ["unique_id"], name: "index_contents_on_unique_id"
  end

  create_table "groupcalls", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "choice"
    t.integer "week"
    t.integer "year"
    t.integer "group_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "jwt_blacklists", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "jti", null: false
    t.datetime "exp"
    t.index ["jti"], name: "index_jwt_blacklists_on_jti"
  end

  create_table "mentee_feedbacks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_id"
    t.integer "mentee_id"
    t.text "feedback"
    t.integer "effort"
    t.integer "understanding"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mentor_feedbacks", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "user_id"
    t.integer "mentor_id"
    t.text "feedback"
    t.integer "timeGiven"
    t.integer "capability"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "mmts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "mentor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["mentor_id"], name: "index_mmts_on_mentor_id", unique: true
    t.index ["user_id"], name: "index_mmts_on_user_id", unique: true
  end

  create_table "otps", id: :integer, unsigned: true, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", null: false
    t.integer "OTP", null: false
    t.integer "retryCount", null: false
    t.boolean "active", default: true, null: false
    t.datetime "createdAt", null: false
    t.datetime "updatedAt", null: false
    t.index ["id"], name: "id", unique: true
  end


  create_table "submissions", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.integer "content_id"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "content_id"], name: "index_submissions_on_user_id_and_content_id", unique: true
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name", default: ""
    t.string "bio", default: ""
    t.string "image_url", default: ""
    t.integer "kind", default: 0
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username", default: "", null: false
    t.integer "buddy", default: 0
    t.string "discord_id", default: "", null: false
    t.boolean "active"
    t.integer "role"
    t.integer "score"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "writeups", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "user_id"
    t.text "description"
    t.integer "week"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end


  add_foreign_key "Chapters", "Curriculums", column: "curriculumId", name: "Chapters_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Gbus", "Users", column: "userId", name: "Gbus_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "MenteeFeedbacks", "Users", column: "menteeId", name: "MenteeFeedbacks_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "MenteeFeedbacks", "Users", column: "userId", name: "MenteeFeedbacks_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "MentorFeedbacks", "Users", column: "mentorId", name: "MentorFeedbacks_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "MentorFeedbacks", "Users", column: "userId", name: "MentorFeedbacks_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Mentors", "Users", column: "menteeId", name: "Mentors_ibfk_2", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Mentors", "Users", column: "mentorId", name: "Mentors_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ProgressChapters", "Chapters", column: "chapterId", name: "ProgressChapters_ibfk_13", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ProgressChapters", "Users", column: "userId", name: "ProgressChapters_ibfk_14", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ProgressCurriculums", "Curriculums", column: "curriculumId", name: "ProgressCurriculums_ibfk_13", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ProgressCurriculums", "Users", column: "userId", name: "ProgressCurriculums_ibfk_14", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ProgressTasks", "Tasks", column: "taskId", name: "ProgressTasks_ibfk_13", on_update: :cascade, on_delete: :nullify
  add_foreign_key "ProgressTasks", "Users", column: "userId", name: "ProgressTasks_ibfk_14", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Projects", "Users", column: "userId", name: "Projects_ibfk_1", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Tasks", "Chapters", column: "chapterId", name: "Tasks_ibfk_14", on_update: :cascade, on_delete: :nullify
  add_foreign_key "Tasks", "Curriculums", column: "curriculumId", name: "Tasks_ibfk_13", on_update: :cascade, on_delete: :nullify

end
