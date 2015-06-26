# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20150625231735) do

  create_table "cidades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "curtidas", force: :cascade do |t|
    t.integer  "dog_id",      null: false
    t.integer  "dog_alvo_id", null: false
    t.boolean  "curtiu",      null: false
    t.integer  "match_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "curtidas", ["dog_id"], name: "index_curtidas_on_dog_id"

  create_table "dogs", force: :cascade do |t|
    t.integer  "dono_id",                                     null: false
    t.string   "nome",                                        null: false
    t.string   "sexo",              limit: 1,                 null: false
    t.integer  "raca_id",                                     null: false
    t.integer  "cidade_id",                                   null: false
    t.integer  "foto_id"
    t.text     "descricao_perfil"
    t.boolean  "tem_pedigree",                default: false, null: false
    t.boolean  "interessa_cruzar",            default: true,  null: false
    t.boolean  "interessa_passear",           default: true,  null: false
    t.datetime "datahora_excluido"
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "dogs", ["dono_id"], name: "index_dogs_on_dono_id"

  create_table "donos", force: :cascade do |t|
    t.string   "nome",                 null: false
    t.string   "sexo",       limit: 1, null: false
    t.string   "email",                null: false
    t.integer  "foto_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "image"
    t.string   "token"
    t.string   "expires_at"
  end

  create_table "faros", force: :cascade do |t|
    t.integer  "dog_id",                           null: false
    t.string   "sexo_dono",              limit: 1
    t.string   "sexo_dog",               limit: 1
    t.integer  "raca_id"
    t.integer  "cidade_id"
    t.boolean  "interessa_tem_pedigree"
    t.boolean  "interessa_cruzar"
    t.boolean  "interessa_passear"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "faros", ["dog_id"], name: "index_faros_on_dog_id"

  create_table "fotos", force: :cascade do |t|
    t.string   "url",        null: false
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fotos_dogs", force: :cascade do |t|
    t.integer  "dog_id",     null: false
    t.integer  "foto_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fotos_dogs", ["dog_id"], name: "index_fotos_dogs_on_dog_id"

  create_table "fotos_donos", force: :cascade do |t|
    t.integer  "dono_id",    null: false
    t.integer  "foto_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "fotos_donos", ["dono_id"], name: "index_fotos_donos_on_dono_id"

  create_table "latidas", force: :cascade do |t|
    t.integer  "match_id",    null: false
    t.integer  "de_dog_id",   null: false
    t.integer  "para_dog_id", null: false
    t.text     "mensagem",    null: false
    t.datetime "enviada_em",  null: false
    t.datetime "lida_em"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "latidas", ["match_id"], name: "index_latidas_on_match_id"

  create_table "matches", force: :cascade do |t|
    t.integer  "dog1_id",                null: false
    t.integer  "dog2_id",                null: false
    t.datetime "datahora_dog1_viu"
    t.datetime "datahora_dog2_viu"
    t.datetime "datahora_dog1_desistiu"
    t.datetime "datahora_dog2_desistiu"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "matches", ["dog1_id"], name: "index_matches_on_dog1_id"
  add_index "matches", ["dog2_id"], name: "index_matches_on_dog2_id"

  create_table "racas", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "token"
    t.datetime "expires_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "email"
  end

end
