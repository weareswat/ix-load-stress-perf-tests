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

ActiveRecord::Schema.define(version: 2020_01_16_155720) do

  create_table "account_aggregations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.date "calendar_date"
    t.string "aggregation_type"
    t.integer "plan_id"
    t.string "plan_name"
    t.integer "aggregation_value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.float "aggregation_payment"
    t.index ["calendar_date", "aggregation_type", "plan_id"], name: "ActiveAccountsIndex", unique: true
  end

  create_table "account_partnership_tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "buyer_account_id"
    t.integer "partnership_token_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_pictures", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "size"
    t.integer "width"
    t.integer "height"
    t.integer "parent_id"
    t.string "content_type"
    t.string "filename"
    t.string "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "account_resets", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.datetime "reset_at"
    t.text "token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "active", default: true
  end

  create_table "account_tabs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "tab_id"
    t.integer "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_account_tabs_on_account_id"
  end

  create_table "account_versions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "version"
    t.string "name", limit: 100, default: ""
    t.string "email"
    t.datetime "updated_at"
    t.string "remember_token", limit: 40
    t.datetime "remember_token_expires_at"
    t.string "activation_code", limit: 40
    t.datetime "activated_at"
    t.string "state", default: "passive"
    t.datetime "deleted_at"
    t.string "organization_name"
    t.integer "tax_location_id"
    t.text "address"
    t.string "fiscal_id"
    t.string "postal_code"
    t.string "phone"
    t.string "mobile"
    t.string "fax"
    t.string "website"
    t.integer "currency_id"
    t.string "time_zone"
    t.integer "invitation_id"
    t.integer "invitation_limit"
    t.datetime "purchased_at"
    t.integer "owner_id"
    t.string "language", limit: 4
    t.string "current_serie"
    t.integer "picture_id"
    t.text "delete_token"
    t.string "invoice_footer"
    t.integer "current_tax_id"
    t.string "invoice_mail_subject"
    t.text "invoice_mail_body"
    t.string "receipt_mail_subject"
    t.text "receipt_mail_body"
    t.string "capital_social"
    t.string "matricula"
    t.string "conservatoria"
    t.string "city"
    t.boolean "esignature"
    t.float "credit"
    t.integer "discount_code_id"
    t.boolean "discount_used"
    t.string "nib"
    t.string "referral_token"
    t.integer "referrer_id"
    t.string "bank_data_type1"
    t.string "bank_data_type2"
    t.string "bank_data_type3"
    t.string "bank_data1"
    t.string "bank_data2"
    t.string "bank_data3"
    t.string "pdf_template", default: "template_00"
    t.boolean "from_google", default: false
    t.integer "affiliation_token_id"
    t.string "debit_note_mail_subject"
    t.text "debit_note_mail_body"
    t.string "credit_note_mail_subject"
    t.text "credit_note_mail_body"
    t.string "estimate_mail_subject"
    t.text "estimate_mail_body"
    t.string "guide_mail_subject"
    t.text "guide_mail_body"
    t.boolean "firstTime"
    t.integer "payment_days"
    t.integer "send_options"
    t.text "observations"
    t.decimal "condition_one_shot_percentage", precision: 5, scale: 2
    t.decimal "condition_recurring_percentage", precision: 5, scale: 2
    t.decimal "condition_first_jukebox_percentage", precision: 5, scale: 2
    t.decimal "condition_other_jukebox_percentage", precision: 5, scale: 2
    t.decimal "discount_percentage", precision: 5, scale: 2
    t.integer "marketing_id"
    t.boolean "factura_recibo"
    t.boolean "hide_account_info"
    t.string "cash_invoice_mail_subject"
    t.text "cash_invoice_mail_body"
    t.string "purchase_order_mail_subject"
    t.text "purchase_order_mail_body"
    t.boolean "send_token"
    t.string "sequence_number_mode", default: "auto"
    t.boolean "from_appdirect", default: false
    t.boolean "synced_with_appdirect", default: false
    t.string "appd_id"
    t.boolean "deleted_flag", default: false
    t.string "open_account_link_mail_subject"
    t.text "open_account_link_mail_body"
    t.integer "provider_id"
    t.boolean "from_api", default: false
    t.boolean "from_bo", default: false
    t.string "decimal_marker"
    t.integer "phone_country_id"
    t.integer "current_mb_provider_id"
    t.boolean "allows_multiple_nif", default: false
    t.string "billing_organization_name"
    t.string "billing_fiscal_id"
    t.string "billing_email"
    t.string "billing_address"
    t.string "billing_postal_code"
    t.boolean "auto_add_payment_reference", default: true
    t.boolean "auto_add_payment_reference_estimates"
    t.boolean "auto_send_invoice_from_estimate"
    t.string "lead_generator"
    t.string "at_subuser"
    t.string "at_pass"
    t.string "at_communication_type"
    t.date "at_setup_date"
    t.boolean "at_communication_halted"
    t.string "tax_exemption_code"
    t.string "payment_mechanism"
    t.boolean "iva_caixa"
    t.integer "billing_country_id"
    t.date "iva_caixa_date"
    t.string "billing_city"
    t.integer "item_id"
    t.string "item_type", default: "Account"
    t.datetime "created_at"
    t.index ["account_id"], name: "index_account_versions_on_account_id"
  end

  create_table "accounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 20, default: ""
    t.string "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "remember_token", limit: 40
    t.datetime "remember_token_expires_at"
    t.string "activation_code", limit: 40
    t.datetime "activated_at"
    t.string "state", default: "passive"
    t.datetime "deleted_at"
    t.string "organization_name"
    t.integer "tax_location_id"
    t.text "address"
    t.string "fiscal_id"
    t.string "postal_code"
    t.string "phone"
    t.string "mobile"
    t.string "fax"
    t.string "website"
    t.integer "currency_id"
    t.string "time_zone"
    t.integer "invitation_id"
    t.integer "invitation_limit"
    t.datetime "purchased_at"
    t.integer "owner_id"
    t.string "language", limit: 4
    t.string "current_serie"
    t.integer "version"
    t.integer "picture_id"
    t.string "invoice_footer"
    t.text "delete_token"
    t.integer "current_tax_id"
    t.string "invoice_mail_subject"
    t.text "invoice_mail_body"
    t.string "receipt_mail_subject"
    t.text "receipt_mail_body"
    t.string "capital_social"
    t.string "matricula"
    t.string "conservatoria"
    t.string "city"
    t.boolean "esignature"
    t.float "credit"
    t.integer "discount_code_id"
    t.boolean "discount_used"
    t.string "nib"
    t.string "referral_token"
    t.integer "referrer_id"
    t.string "bank_data_type1"
    t.string "bank_data_type2"
    t.string "bank_data_type3"
    t.string "bank_data1"
    t.string "bank_data2"
    t.string "bank_data3"
    t.string "pdf_template", default: "template_00"
    t.boolean "from_google", default: false
    t.string "debit_note_mail_subject"
    t.text "debit_note_mail_body"
    t.string "credit_note_mail_subject"
    t.text "credit_note_mail_body"
    t.string "estimate_mail_subject"
    t.text "estimate_mail_body"
    t.string "guide_mail_subject"
    t.text "guide_mail_body"
    t.integer "affiliation_token_id"
    t.boolean "firstTime", default: false
    t.integer "payment_days"
    t.integer "send_options"
    t.text "observations"
    t.decimal "condition_one_shot_percentage", precision: 5, scale: 2
    t.decimal "condition_recurring_percentage", precision: 5, scale: 2
    t.decimal "condition_first_jukebox_percentage", precision: 5, scale: 2
    t.decimal "condition_other_jukebox_percentage", precision: 5, scale: 2
    t.decimal "discount_percentage", precision: 5, scale: 2
    t.integer "marketing_id"
    t.boolean "factura_recibo", default: false
    t.boolean "hide_account_info"
    t.string "cash_invoice_mail_subject"
    t.text "cash_invoice_mail_body"
    t.string "purchase_order_mail_subject"
    t.text "purchase_order_mail_body"
    t.boolean "send_token", default: false
    t.string "sequence_number_mode", default: "auto"
    t.boolean "from_appdirect", default: false
    t.boolean "synced_with_appdirect", default: false
    t.string "appd_id"
    t.boolean "deleted_flag", default: false
    t.string "open_account_link_mail_subject"
    t.text "open_account_link_mail_body"
    t.integer "provider_id"
    t.boolean "from_api", default: false
    t.boolean "from_bo", default: false
    t.string "decimal_marker"
    t.string "account_id"
    t.integer "phone_country_id"
    t.integer "current_mb_provider_id"
    t.boolean "allows_multiple_nif", default: false
    t.string "billing_organization_name"
    t.string "billing_fiscal_id"
    t.string "billing_email"
    t.string "billing_address"
    t.string "billing_postal_code"
    t.boolean "auto_add_payment_reference", default: true
    t.boolean "auto_add_payment_reference_estimates"
    t.boolean "auto_send_invoice_from_estimate"
    t.string "lead_generator"
    t.string "at_subuser"
    t.string "at_pass"
    t.string "at_communication_type"
    t.date "at_setup_date"
    t.boolean "at_communication_halted"
    t.string "tax_exemption_code"
    t.string "payment_mechanism"
    t.boolean "iva_caixa"
    t.integer "billing_country_id"
    t.date "iva_caixa_date"
    t.string "billing_city"
    t.index ["name"], name: "index_accounts_on_name"
  end

  create_table "active_orders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "ip_adress"
    t.string "first_name"
    t.string "last_name"
    t.string "card_type"
    t.date "card_expires_on"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "express_token"
    t.string "express_payer_id"
  end

  create_table "activities", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "actor_id"
    t.integer "subject_id", null: false
    t.string "subject_type", default: "", null: false
    t.string "action", default: "", null: false
    t.datetime "created_at", null: false
    t.text "content"
    t.integer "old_actor_id"
    t.integer "new_actor_id"
    t.string "new_actor_type", default: "Membership"
    t.integer "account_reset_id"
    t.index ["new_actor_id"], name: "index_activities_on_new_actor_id"
    t.index ["subject_id"], name: "subject_id"
  end

  create_table "addresses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "owner_type"
    t.integer "owner_id"
    t.string "detail"
    t.string "postal_code"
    t.string "city"
    t.integer "tax_location_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_type", "owner_id"], name: "index_addresses_on_owner_type_and_owner_id"
  end

  create_table "affiliation_conditions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "one_shot_percentage", precision: 5, scale: 2
    t.decimal "recurring_percentage", precision: 5, scale: 2
    t.decimal "first_jukebox_percentage", precision: 5, scale: 2
    t.decimal "other_jukebox_percentage", precision: 5, scale: 2
    t.boolean "default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "affiliation_discounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "one_shot_percentage", precision: 5, scale: 2
    t.decimal "recurring_percentage", precision: 5, scale: 2
    t.decimal "first_jukebox_percentage", precision: 5, scale: 2
    t.decimal "other_jukebox_percentage", precision: 5, scale: 2
    t.boolean "default"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "affiliation_condition_id"
  end

  create_table "affiliation_tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "parent_id"
    t.integer "affiliation_discount_id"
    t.integer "affiliation_condition_id"
    t.string "token"
    t.boolean "active"
    t.decimal "condition_one_shot_percentage", precision: 5, scale: 2
    t.decimal "condition_recurring_percentage", precision: 5, scale: 2
    t.decimal "condition_first_jukebox_percentage", precision: 5, scale: 2
    t.decimal "condition_other_jukebox_percentage", precision: 5, scale: 2
    t.decimal "discount_one_shot_percentage", precision: 5, scale: 2
    t.decimal "discount_recurring_percentage", precision: 5, scale: 2
    t.decimal "discount_first_jukebox_percentage", precision: 5, scale: 2
    t.decimal "discount_other_jukebox_percentage", precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "associations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "client_id"
    t.integer "associated_account_id"
    t.integer "associated_contact_id"
    t.string "contact_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_associations_on_account_id"
  end

  create_table "at_document_statuses", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "invoice_id"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "delayed_job_id"
    t.datetime "delayed_job_run_at"
    t.integer "account_id"
    t.index ["account_id"], name: "index_at_document_statuses_on_account_id"
    t.index ["invoice_id"], name: "index_at_document_statuses_on_invoice_id"
    t.index ["status"], name: "index_at_document_statuses_on_status"
  end

  create_table "at_requests", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "at_document_status_id"
    t.integer "response_code"
    t.string "response_message"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "raw_response"
    t.text "raw_request"
    t.integer "account_id"
    t.integer "invoice_id"
    t.index ["account_id"], name: "index_at_requests_on_account_id"
    t.index ["at_document_status_id"], name: "index_at_requests_on_at_document_status_id"
    t.index ["invoice_id"], name: "index_at_requests_on_invoice_id"
    t.index ["response_code"], name: "index_at_requests_on_response_code"
  end

  create_table "calendar", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.date "date"
  end

  create_table "client_applications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "url"
    t.string "support_url"
    t.string "callback_url"
    t.string "key", limit: 20
    t.string "secret", limit: 40
    t.integer "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["key"], name: "index_client_applications_on_key", unique: true
  end

  create_table "client_contacts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "phone"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "client_id"
    t.integer "tax_country_id"
    t.integer "mobile"
    t.integer "mobile_country_id"
    t.index ["client_id"], name: "index_client_contacts_on_client_id"
  end

  create_table "client_payment_references", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "invoice_id"
    t.integer "payment_reference_id"
    t.string "payment_reference_type"
    t.boolean "first_ref"
    t.string "status", default: "not_paid"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client_references", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "reference"
    t.string "entity"
    t.decimal "value", precision: 10, scale: 2
    t.integer "compra_facil_id"
    t.integer "invoice_id"
    t.text "token"
    t.datetime "payed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_reset_id"
  end

  create_table "client_versions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "client_id"
    t.integer "version"
    t.string "name"
    t.text "address"
    t.string "postal_code"
    t.string "fiscal_id"
    t.string "email"
    t.string "fax"
    t.string "phone"
    t.string "website"
    t.datetime "updated_at"
    t.integer "account_id"
    t.string "country"
    t.text "observations"
    t.integer "send_options"
    t.integer "payment_days", default: 0
    t.boolean "deleted"
    t.string "language"
    t.datetime "last_update"
    t.string "contact_type", default: "client"
    t.integer "account_reset_id"
    t.decimal "avg_payment_days", precision: 11, scale: 2, default: "0.0"
    t.integer "phone_country_id"
    t.string "code"
    t.integer "mobile_country_id"
    t.integer "mobile"
    t.integer "currency_id"
    t.string "tax_exemption_code"
    t.string "payment_mechanism"
    t.string "city"
    t.integer "item_id"
    t.string "item_type", default: "Client"
    t.datetime "created_at"
    t.index ["account_id", "client_id", "version", "account_reset_id"], name: "index_client_versions_for_invoices_search"
    t.index ["client_id"], name: "index_client_versions_on_client_id"
  end

  create_table "clients", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.text "address"
    t.string "postal_code"
    t.string "fiscal_id"
    t.string "email"
    t.string "fax"
    t.string "phone"
    t.string "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_id"
    t.integer "version"
    t.string "country"
    t.text "observations"
    t.integer "send_options"
    t.integer "payment_days"
    t.boolean "deleted"
    t.string "language"
    t.datetime "last_update"
    t.string "contact_type", default: "client"
    t.integer "account_reset_id"
    t.decimal "avg_payment_days", precision: 11, scale: 2, default: "0.0"
    t.integer "phone_country_id"
    t.string "code"
    t.integer "mobile_country_id"
    t.integer "mobile"
    t.integer "currency_id"
    t.string "tax_exemption_code"
    t.string "payment_mechanism"
    t.string "city"
    t.index ["account_id"], name: "index_clients_on_account_id"
    t.index ["id", "account_id", "name", "code", "deleted", "account_reset_id"], name: "index_clients_on_account_id_and_more_search"
  end

  create_table "comment_versions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "version"
    t.integer "comment_id"
    t.integer "user_id"
    t.string "message"
    t.integer "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.string "user_type", default: "User"
  end

  create_table "comments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.string "message"
    t.integer "invoice_id"
    t.integer "version"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.string "user_type", default: "User"
    t.index ["invoice_id"], name: "index_comments_on_invoice_id"
  end

  create_table "compra_facils", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "cf_user"
    t.string "cf_pass"
    t.string "nib"
    t.integer "account_id"
    t.boolean "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "email"
    t.text "morada"
    t.string "localidade"
    t.string "cod_postal"
    t.string "telefone"
    t.string "nif"
    t.string "nome_contacto"
    t.string "tel_contacto"
    t.text "des_social"
    t.string "tipo"
  end

  create_table "currencies", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "symbol"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "code"
    t.integer "prefered"
  end

  create_table "delayed_jobs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "priority", default: 0
    t.integer "attempts", default: 0
    t.text "handler"
    t.text "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string "locked_by"
    t.text "result"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "queue_name"
    t.index ["locked_by"], name: "index_on_locked_by"
  end

  create_table "discount_codes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "code"
    t.decimal "value", precision: 10
    t.integer "times_used"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.boolean "active"
    t.string "description"
    t.integer "limit"
    t.string "type"
    t.integer "membership_id"
    t.integer "sales_commission_percentagem"
  end

  create_table "discounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "length"
    t.integer "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "monthly_discount", precision: 16, scale: 4
  end

  create_table "document_annotations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "document_id"
    t.boolean "archived"
    t.boolean "refused"
    t.boolean "read"
    t.integer "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "document_batches", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "number_of_documents"
    t.integer "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_document_batches_on_account_id"
  end

  create_table "easypay_client_references", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "easypay_client_id"
    t.string "reference"
    t.string "entity"
    t.decimal "value", precision: 11, scale: 2
    t.text "token"
    t.text "key_identifier"
    t.datetime "payed_at"
    t.string "status", default: "not_paid"
    t.string "creditcard_link"
    t.text "ep_message"
    t.text "last_error_log"
    t.string "type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "payment_type"
    t.integer "account_reset_id"
  end

  create_table "easypay_clients", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "ep_user"
    t.string "ep_cin"
    t.string "company_responsible"
    t.string "company_name"
    t.text "address"
    t.string "postal_code"
    t.string "city"
    t.string "country"
    t.string "phone"
    t.string "email"
    t.string "invoice_email"
    t.string "tecnical_email"
    t.string "notification_email"
    t.string "iban"
    t.integer "vat_number"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "entity"
    t.boolean "is_partner", default: false
    t.string "s_code", limit: 50
    t.datetime "deleted_date"
    t.integer "deleted_by"
    t.string "public_key"
  end

  create_table "easypay_notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "ep_doc"
    t.string "ep_cin"
    t.string "ep_user"
    t.string "ep_status", default: "pending"
    t.string "ep_payment_type"
    t.decimal "ep_value_fixed", precision: 16, scale: 2
    t.decimal "ep_value_var", precision: 16, scale: 2
    t.decimal "ep_value_tax", precision: 16, scale: 2
    t.decimal "ep_value_transf", precision: 16, scale: 2
    t.datetime "ep_date_transf"
    t.datetime "ep_date_read"
    t.string "ep_status_read"
    t.text "ep_message"
    t.text "last_error_log"
    t.integer "easypay_reference_id"
    t.integer "easypay_client_reference_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "easypay_references", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "reference"
    t.string "entity"
    t.decimal "value", precision: 11, scale: 2
    t.integer "account_id"
    t.integer "plan_id"
    t.integer "duration"
    t.string "token"
    t.datetime "payed_at"
    t.string "status", default: "not_paid"
    t.integer "new_account_credit"
    t.string "type"
    t.string "key_identifier"
    t.string "creditcard_link"
    t.text "ep_message"
    t.text "last_error_log"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "successfull_payments_count"
    t.boolean "is_recurrent"
    t.string "payment_type"
  end

  create_table "feature_flags", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "full_release", default: false
  end

  create_table "feature_flags_accounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.boolean "active"
    t.integer "feature_flag_id"
    t.integer "account_id"
    t.integer "using_count"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "fulltext_rows", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "fulltextable_type", limit: 50, null: false
    t.integer "fulltextable_id", null: false
    t.text "value", null: false
    t.integer "parent_id"
    t.index ["fulltextable_type", "fulltextable_id"], name: "index_fulltext_rows_on_fulltextable_type_and_fulltextable_id", unique: true
    t.index ["parent_id"], name: "index_fulltext_rows_on_parent_id"
    t.index ["value"], name: "fulltext_index", type: :fulltext
  end

  create_table "import_previews", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "raw"
    t.text "file_name"
    t.integer "account_id"
    t.integer "user_id"
    t.boolean "is_metadata"
    t.text "status"
    t.text "import_type"
    t.integer "reference"
    t.boolean "is_valid"
    t.text "target"
    t.datetime "date"
    t.integer "seq"
    t.index ["reference"], name: "index_on_reference"
  end

  create_table "imported_invoices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "invoice_id"
    t.integer "batch_id"
    t.index ["batch_id"], name: "index_imported_invoices_on_batch_id"
    t.index ["invoice_id"], name: "index_imported_invoices_on_invoice_id"
  end

  create_table "invitations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "sender_id"
    t.string "recipient_email"
    t.string "token"
    t.datetime "sent_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoice_items", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "invoice_id"
    t.decimal "unit_price_old", precision: 16, scale: 2
    t.decimal "quantity", precision: 16, scale: 2
    t.string "description"
    t.decimal "discount_old", precision: 5, scale: 2
    t.integer "product_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "tax_value", precision: 5, scale: 2
    t.decimal "subtotal_old", precision: 11, scale: 2
    t.decimal "total_old", precision: 11, scale: 2
    t.decimal "discount_amount_old", precision: 11, scale: 2
    t.decimal "tax_amount_old", precision: 9, scale: 4
    t.integer "tax_id"
    t.string "name"
    t.integer "tax_id_2"
    t.decimal "tax_value_2", precision: 5, scale: 2
    t.decimal "tax_amount_2", precision: 11, scale: 2
    t.string "tax_name"
    t.string "tax_name_2"
    t.decimal "unit_price", precision: 18, scale: 4
    t.string "unit"
    t.string "tax_code"
    t.string "tax_region"
    t.decimal "discount", precision: 9, scale: 4
    t.decimal "tax_amount", precision: 24, scale: 10
    t.decimal "total_old_2", precision: 16, scale: 2
    t.decimal "subtotal_old_2", precision: 16, scale: 2
    t.decimal "discount_amount_old_2", precision: 16, scale: 2
    t.decimal "rrp", precision: 18, scale: 4
    t.decimal "subtotal", precision: 24, scale: 10
    t.decimal "discount_amount", precision: 24, scale: 10
    t.decimal "total", precision: 18, scale: 4
    t.decimal "raw_subtotal", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_discount_amount", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_tax_amount", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_tax_amount_2", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_rrp", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_total", precision: 16, scale: 4, default: "0.0"
    t.index ["invoice_id"], name: "index_invoice_items_on_invoice_id"
    t.index ["product_id"], name: "index_invoice_items_on_product_id"
  end

  create_table "invoice_mb_references", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "invoice_id"
    t.integer "mb_reference_id"
    t.string "mb_reference_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["invoice_id"], name: "index_invoice_mb_references_on_invoice_id"
  end

  create_table "invoices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "client_id"
    t.string "reference"
    t.datetime "date"
    t.datetime "due_date"
    t.text "observations"
    t.decimal "discount_old", precision: 5, scale: 2
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.integer "schedule_id"
    t.integer "account_id"
    t.decimal "total", precision: 11, scale: 2
    t.decimal "subtotal", precision: 11, scale: 2
    t.decimal "total_before_taxes", precision: 11, scale: 2
    t.decimal "total_taxes", precision: 11, scale: 2
    t.decimal "total_discount", precision: 11, scale: 2
    t.string "sequence_number"
    t.integer "owner_invoice_id"
    t.text "cancel_message"
    t.integer "client_version"
    t.integer "sequence_id"
    t.decimal "retention", precision: 5, scale: 2
    t.integer "account_version"
    t.boolean "mb_reference"
    t.boolean "archived"
    t.integer "subscription_id"
    t.text "load_site"
    t.text "delivery_site"
    t.string "license_plate"
    t.datetime "loaded_at"
    t.decimal "discount", precision: 9, scale: 4
    t.text "encrypted_doc"
    t.datetime "final_date"
    t.integer "received_po_id"
    t.string "manual_sequence_number"
    t.integer "account_reset_id"
    t.string "document_serie"
    t.string "document_number"
    t.text "saft_hash"
    t.decimal "total_paid", precision: 11, scale: 2, default: "0.0"
    t.datetime "paid_at"
    t.decimal "total_paid_before_taxes", precision: 11, scale: 2, default: "0.0"
    t.decimal "raw_subtotal", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_total_discount", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_total_before_taxes", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_total_taxes", precision: 16, scale: 4, default: "0.0"
    t.decimal "raw_total", precision: 16, scale: 4, default: "0.0"
    t.integer "phone_country_id"
    t.string "token", limit: 50
    t.datetime "pre_overdue_alert_date"
    t.datetime "post_overdue_alert_date"
    t.datetime "estimate_date"
    t.decimal "total_currency_rate", precision: 16, scale: 6
    t.decimal "raw_total_currency_rate", precision: 16, scale: 4, default: "0.0"
    t.integer "currency_id"
    t.decimal "rate", precision: 16, scale: 6, default: "1.0"
    t.boolean "auto_add_related_document"
    t.string "tax_exemption_code"
    t.string "tax_exemption_message"
    t.integer "address_to_id"
    t.integer "address_from_id"
    t.string "at_doc_code_id"
    t.text "raw_owner_invoice"
    t.string "created_from"
    t.integer "series_configuration_id"
    t.string "client_name"
    t.string "client_country"
    t.boolean "account_fatura_recibo"
    t.index ["account_id", "created_at"], name: "index_invoices_on_account_id_and_created_at"
    t.index ["account_id", "date"], name: "index_invoices_on_account_id_and_date"
    t.index ["account_id", "type", "status"], name: "index_invoices_on_account_id_and_type_and_status"
    t.index ["client_id"], name: "index_invoices_on_client_id"
    t.index ["created_from"], name: "index_invoices_on_created_from"
    t.index ["date", "sequence_id", "status"], name: "index_invoices_on_date_and_sequence_id_and_status"
    t.index ["owner_invoice_id"], name: "index_invoices_on_owner_invoice_id"
    t.index ["received_po_id"], name: "index_invoices_on_received_po_id"
    t.index ["schedule_id"], name: "index_invoices_on_schedule_id"
    t.index ["sequence_id", "document_number"], name: "index_invoices_on_sequence_id_and_document_number"
    t.index ["token"], name: "index_invoices_on_token"
  end

  create_table "ip_group_country", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.bigint "ip_start", null: false
    t.string "ip_cidr", limit: 20, null: false
    t.string "country_code", limit: 2, null: false
    t.string "country_name", limit: 64, null: false
    t.index ["country_code"], name: "country"
    t.index ["ip_start"], name: "ip_start", unique: true
  end

  create_table "jukes_c_docs", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "subscription_id"
    t.integer "documents_paid"
    t.bigint "document_count", default: 0, null: false
    t.datetime "last_doc"
  end

  create_table "jukes_s_docs", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id"
  end

  create_table "last_presented_features", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "new_features_id"
    t.integer "users_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "marketings", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "source_url"
    t.string "entry_page"
    t.string "search_terms"
    t.string "adw_campaign"
    t.string "adw_ad_group"
    t.string "adw_ad"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "btn_clicked"
    t.string "campaign_source"
    t.string "campaign_name"
    t.string "campaign_medium"
    t.string "campaign_term"
    t.string "campaign_content"
    t.string "first_visit"
    t.string "previous_visit"
    t.string "current_visit_started"
    t.string "times_visited"
  end

  create_table "max_subs", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "id"
    t.integer "account_id"
    t.integer "tipo_conta", default: 0, null: false
  end

  create_table "mb_providers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "provider_id"
    t.string "provider_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "mbreferences", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "reference"
    t.string "entity"
    t.decimal "value", precision: 11, scale: 2
    t.integer "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "plan_id"
    t.integer "duration"
    t.text "token"
    t.datetime "payed_at"
    t.string "state"
    t.integer "new_account_credit"
  end

  create_table "memberships", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "api_key"
    t.boolean "synced_with_appdirect", default: false
    t.index ["account_id"], name: "index_memberships_on_account_id"
    t.index ["user_id"], name: "index_memberships_on_user_id"
  end

  create_table "memberships_roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "membership_id"
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["membership_id"], name: "index_memberships_roles_on_membership_id"
    t.index ["role_id"], name: "index_memberships_roles_on_role_id"
  end

  create_table "multi_accounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "parent_account_id"
    t.integer "child_account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "activated_at"
    t.boolean "active"
    t.datetime "deactivated_at"
  end

  create_table "new_features", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "title_en"
    t.text "description_en"
    t.string "title_es"
    t.text "description_es"
    t.string "title_pt"
    t.text "description_pt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notification_configurations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.string "gateway"
    t.string "subject"
    t.integer "client_id"
    t.text "template_email"
    t.text "template_sms"
    t.string "notification_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "sms_enabled"
    t.boolean "email_enabled"
    t.integer "days"
    t.integer "recurrence_days"
    t.integer "modified_by"
    t.boolean "recurrence_enabled"
    t.boolean "send_copy"
    t.boolean "enabled"
    t.string "email_from"
    t.string "email_bcc"
    t.string "email_cc"
    t.boolean "email_logo", default: false
    t.boolean "send_current_account_link", default: true
    t.string "language"
    t.index ["account_id"], name: "index_notification_configurations_on_account_id"
    t.index ["client_id", "notification_type", "account_id", "enabled"], name: "index_on_client_id_and_type_and_account_id_and_enabled"
  end

  create_table "notification_logs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "client_id"
    t.integer "document_id"
    t.text "via_email"
    t.text "via_sms"
    t.string "text_message_id"
    t.integer "membership_id"
    t.string "notification_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "recipients"
    t.string "data"
  end

  create_table "notify_events", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "type"
    t.integer "originator_id"
    t.string "originator_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "event_path"
    t.text "data"
    t.index ["originator_id"], name: "index_notify_events_on_originator_id"
  end

  create_table "notify_notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "event_id"
    t.integer "user_id"
    t.boolean "archived", default: false
    t.boolean "unread", default: true
    t.boolean "deleted", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "from"
    t.string "subject"
    t.integer "account_id"
    t.index ["user_id", "account_id"], name: "index_notify_notifications_on_user_id_and_account_id"
  end

  create_table "oauth_nonces", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "nonce"
    t.integer "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["nonce", "timestamp"], name: "index_oauth_nonces_on_nonce_and_timestamp", unique: true
  end

  create_table "oauth_tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "provider_id"
    t.string "type", limit: 20
    t.integer "client_application_id"
    t.string "token", limit: 20
    t.string "secret", limit: 40
    t.string "callback_url"
    t.string "verifier", limit: 20
    t.datetime "authorized_at"
    t.datetime "invalidated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["token"], name: "index_oauth_tokens_on_token", unique: true
  end

  create_table "open_id_authentication_associations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "issued"
    t.integer "lifetime"
    t.string "handle"
    t.string "assoc_type"
    t.binary "server_url"
    t.binary "secret"
  end

  create_table "open_id_authentication_nonces", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "timestamp", null: false
    t.string "server_url"
    t.string "salt", null: false
  end

  create_table "order_transactions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "order_id"
    t.string "action"
    t.integer "amount"
    t.boolean "success"
    t.string "authorization"
    t.string "message"
    t.text "params"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "orders", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "plan_id"
    t.decimal "plan_value", precision: 16, scale: 4
    t.string "plan_type"
    t.integer "free_months"
    t.integer "duration"
    t.decimal "credit_left", precision: 16, scale: 4
    t.decimal "credit_remaining", precision: 16, scale: 4
    t.decimal "first_time_discount", precision: 16, scale: 4
    t.decimal "first_time_discount_percentage", precision: 16, scale: 4
    t.decimal "affiliate_first_time_discount", precision: 16, scale: 4
    t.decimal "affiliate_first_time_discount_percentage", precision: 16, scale: 4
    t.decimal "affiliate_recurring_discount", precision: 16, scale: 4
    t.decimal "affiliate_recurring_discount_percentage", precision: 16, scale: 4
    t.decimal "total_before_taxes", precision: 16, scale: 4
    t.decimal "tax_value", precision: 16, scale: 4
    t.decimal "tax_percentage", precision: 16, scale: 4
    t.decimal "value_to_pay", precision: 16, scale: 4
    t.string "gateway"
    t.string "status"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "payment_data_type"
    t.integer "payment_data_id"
    t.decimal "subscription_first_month_to_pay", precision: 16, scale: 4
    t.decimal "subscription_recurring_month_to_pay", precision: 16, scale: 4
    t.integer "parent_id"
    t.string "transaction_id"
    t.decimal "partnership_comission", precision: 7, scale: 4
    t.decimal "partnership_discount", precision: 7, scale: 4
    t.decimal "monthly_fee", precision: 16, scale: 4
    t.index ["transaction_id"], name: "index_orders_on_transaction_id"
  end

  create_table "package_codes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "code"
    t.boolean "used"
    t.datetime "used_at"
    t.integer "plan_id"
    t.integer "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "released", default: false
    t.datetime "released_at"
  end

  create_table "partial_payments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "amount", precision: 11, scale: 2
    t.text "note"
    t.date "payment_date"
    t.integer "document_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "amount_without_taxes", precision: 11, scale: 2
    t.decimal "balance", precision: 11, scale: 2
    t.integer "account_id"
    t.integer "account_reset_id"
    t.integer "receipt_id"
    t.string "payment_mechanism"
    t.boolean "canceled"
    t.index ["account_id"], name: "index_partial_payments_on_account_id"
    t.index ["document_id"], name: "index_partial_payments_on_document_id"
    t.index ["receipt_id"], name: "index_partial_payments_on_receipt_id"
  end

  create_table "partner_comissions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "partner_id"
    t.decimal "total_earned", precision: 16, scale: 4
    t.decimal "total_due", precision: 16, scale: 4
  end

  create_table "partnership_tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "partner_account_id"
    t.string "code"
    t.decimal "comission", precision: 7, scale: 4
    t.decimal "discount", precision: 7, scale: 4
    t.boolean "is_active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "payment_gateway_providers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "account_id"
    t.boolean "active"
    t.string "payment_service"
    t.text "credentials"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_payment_gateway_providers_on_account_id"
  end

  create_table "payment_gateway_references", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "payment_gateway_provider_id"
    t.string "reference"
    t.string "entity"
    t.decimal "value", precision: 11, scale: 2
    t.string "transaction_id"
    t.string "status", default: "not_paid"
    t.datetime "paid_at"
    t.string "payment_type"
    t.integer "account_reset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["payment_gateway_provider_id"], name: "index_payment_gateway_references_on_payment_gateway_provider_id"
  end

  create_table "payment_notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.text "params"
    t.integer "account_id"
    t.string "status"
    t.string "transaction_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "transaction_type"
    t.string "subscription_id"
    t.integer "plan_id"
  end

  create_table "payments", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "original_payment_type"
    t.integer "original_payment_id"
    t.decimal "amount", precision: 16, scale: 4
    t.datetime "date"
    t.integer "account_id"
    t.boolean "affiliate_commission_settled"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "plan_id"
    t.integer "invoice_id"
    t.decimal "affiliate_commission", precision: 16, scale: 4
    t.integer "order_id"
    t.integer "affiliator_id"
    t.boolean "sales_commission_settled"
    t.float "sales_commission"
    t.decimal "partnership_comission_value", precision: 16, scale: 4
  end

  create_table "phone_calling_codes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "phone_code"
    t.string "country_name"
    t.integer "tax_country_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pictures", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "size"
    t.integer "width"
    t.integer "height"
    t.integer "parent_id"
    t.integer "owner_id"
    t.string "content_type"
    t.string "filename"
    t.string "thumbnail"
    t.string "owner_type"
  end

  create_table "plan_discounts", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "discount_code_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "plan_providers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status", default: "active"
    t.index ["plan_id", "provider_id"], name: "index_on_plan_id_and_provider_id"
  end

  create_table "plans", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "status"
    t.integer "value_old"
    t.boolean "allow_signature"
    t.string "type"
    t.decimal "value", precision: 18, scale: 4
    t.string "alternative_name"
    t.boolean "visible"
    t.decimal "sub_account_fee", precision: 10
  end

  create_table "plans_rights", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "plan_id"
    t.integer "right_id"
  end

  create_table "products", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.decimal "unit_price_old", precision: 16, scale: 2
    t.string "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_id"
    t.integer "tax_id"
    t.string "name"
    t.integer "tax_id_2"
    t.decimal "unit_price", precision: 18, scale: 4
    t.string "unit"
    t.string "tax_code"
    t.string "tax_region"
    t.boolean "deleted"
    t.decimal "rrp", precision: 18, scale: 4
    t.integer "account_reset_id"
    t.index ["account_id", "name", "description", "deleted", "account_reset_id"], name: "index_on_account_id_and_name_and_more"
    t.index ["tax_id"], name: "index_on_tax_id"
  end

  create_table "providers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 20
    t.string "secure_key"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "with_css", default: false
    t.boolean "show_plan", default: false
    t.integer "default_plan_id"
    t.string "product_name"
    t.boolean "show_feed_back", default: false
    t.string "path"
    t.string "hostname"
    t.string "email"
    t.string "email_label"
    t.string "contact_label"
    t.boolean "own_header", default: false
    t.string "url_short"
    t.string "url_short_aux"
    t.string "company_name"
    t.string "company_site"
    t.string "from_email"
    t.string "payments_email"
    t.string "notifications_email"
    t.integer "tax_country_id"
    t.integer "software_certificate_number"
    t.string "saft_product_name"
    t.boolean "block_accounts", default: false
    t.text "phone"
    t.text "default_support_channel"
    t.string "public_url_short"
    t.index ["name"], name: "index_providers_on_name"
  end

  create_table "receipt_datas", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "receipt_id"
    t.integer "document_id"
    t.string "document_type"
    t.string "document_sequence_number"
    t.decimal "total", precision: 16, scale: 2
    t.decimal "initial_balance", precision: 16, scale: 2
    t.decimal "percentage_paid", precision: 16, scale: 2
    t.decimal "paid", precision: 16, scale: 2
    t.decimal "final_balance", precision: 16, scale: 2
    t.decimal "tax", precision: 16, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["document_id"], name: "index_receipt_datas_on_document_id"
    t.index ["receipt_id"], name: "index_receipt_datas_on_receipt_id"
  end

  create_table "rejections", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "invoice_id"
    t.integer "account_id"
    t.integer "supplier_client_id"
    t.text "description"
    t.integer "rejected_by_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["invoice_id"], name: "index_rejections_on_invoice_id"
  end

  create_table "report_activity_stats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "days"
    t.integer "activity", default: 0
  end

  create_table "report_evol_month", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "days"
    t.integer "tx_subs", default: 0
    t.integer "tx_jukes", default: 0
  end

  create_table "report_jukes_by_month", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "days"
    t.integer "juke10", default: 0
    t.integer "juke25", default: 0
    t.integer "juke40", default: 0
    t.integer "juke50", default: 0
    t.integer "juke100", default: 0
  end

  create_table "report_subs_by_day", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "days"
    t.integer "subscriptions", default: 0
    t.integer "jukeboxes", default: 0
    t.integer "total", default: 0
  end

  create_table "report_subs_by_month", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "days"
    t.integer "startup", default: 0
    t.integer "small", default: 0
    t.integer "medium", default: 0
    t.integer "large", default: 0
  end

  create_table "report_usage_stats", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "days"
    t.integer "accounts", default: 0
    t.integer "subscriptions", default: 0
  end

  create_table "rights", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "controller"
    t.string "action"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rights_roles", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "right_id"
    t.integer "role_id"
  end

  create_table "roles", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name", limit: 40
    t.string "authorizable_type", limit: 40
    t.integer "authorizable_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "rules", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "limit"
    t.string "period", limit: 11
    t.string "type"
    t.index ["plan_id"], name: "index_rules_on_plan_id"
  end

  create_table "saft_schedule_users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "saft_schedule_id"
    t.integer "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["saft_schedule_id"], name: "index_saft_schedule_users_on_saft_schedule_id"
    t.index ["user_id"], name: "index_saft_schedule_users_on_user_id"
  end

  create_table "saft_schedules", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "account_id", null: false
    t.string "accountant_name"
    t.string "accountant_company"
    t.string "accountant_phone"
    t.string "accountant_email"
    t.boolean "accountant_not_active", default: false
    t.integer "days", null: false
    t.boolean "active", default: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_sent_date"
    t.index ["account_id"], name: "index_saft_schedules_on_account_id"
    t.index ["active"], name: "index_saft_schedules_on_active"
  end

  create_table "schedule_exceptions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "schedule_id"
    t.integer "invoice_id"
    t.datetime "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "scheduler_jobs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "uid"
    t.text "queue_name"
    t.integer "user_id"
    t.integer "account_id"
    t.text "handler"
    t.text "context"
    t.datetime "run_at"
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer "percentage"
    t.string "exception"
    t.boolean "completed"
    t.boolean "success"
    t.integer "surrogate_job_id"
    t.string "surrogate_job_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["account_id"], name: "index_scheduler_jobs_on_account_id"
    t.index ["uid", "completed"], name: "index_scheduler_jobs_on_uid_and_completed"
    t.index ["uid"], name: "index_scheduler_jobs_on_uid"
  end

  create_table "schedules", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.integer "interval"
    t.string "type"
    t.integer "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "next_date"
    t.string "description"
    t.integer "account_id"
    t.boolean "to_send"
    t.boolean "active", default: true
    t.datetime "last_sent"
    t.string "client_name"
    t.boolean "archived"
    t.string "current_sequence_number"
    t.string "email_cc"
    t.string "email_bcc"
    t.integer "account_reset_id"
    t.string "document_type"
  end

  create_table "sequences", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "category"
    t.integer "current_number", default: 0
    t.string "serie"
    t.integer "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "account_reset_id"
    t.integer "series_configuration_id"
    t.index ["account_id"], name: "index_sequences_on_account_id"
  end

  create_table "series_configurations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.string "footer"
    t.string "email"
    t.string "phone"
    t.string "website"
    t.integer "phone_country_id"
    t.integer "picture_id"
    t.string "bank_data_type1"
    t.string "bank_data_type2"
    t.string "bank_data_type3"
    t.string "bank_data1"
    t.string "bank_data2"
    t.string "bank_data3"
    t.integer "account_id"
    t.index ["picture_id"], name: "index_series_configurations_on_picture_id"
  end

  create_table "signed_invoices", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.binary "data", limit: 16777215
    t.integer "invoice_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subs_activas", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
  end

  create_table "subscriptions", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "account_id"
    t.integer "plan_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "payment_type"
    t.boolean "canceled"
    t.boolean "expired_mail_sent"
    t.float "value"
    t.integer "months_of_discount"
    t.decimal "monthly_fee", precision: 18, scale: 4
    t.integer "documents_paid"
    t.integer "payment_id"
    t.decimal "tax_value", precision: 18, scale: 4
    t.boolean "paid", default: false
    t.integer "sms_paid", default: 0
    t.integer "staff_id"
    t.text "observations"
    t.boolean "auto_renewal"
    t.index ["account_id"], name: "index_subscriptions_on_account_id"
  end

  create_table "tabs", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "position"
    t.boolean "active"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tax_countries", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "country_code"
    t.integer "prefered"
  end

  create_table "tax_instances", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "tax_id"
    t.decimal "value", precision: 5, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tax_locations", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "tax_country_id"
    t.string "time_zone"
    t.string "language", limit: 4
    t.integer "currency_id"
    t.integer "client_id"
    t.integer "product_id"
    t.integer "invoice_id"
    t.string "decimal_marker"
  end

  create_table "taxes", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.integer "tax_instance_id"
    t.integer "taxable_id"
    t.string "taxable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal "value", precision: 5, scale: 2
    t.string "code"
    t.string "region"
    t.index ["taxable_id"], name: "index_taxes_on_taxable_id"
  end

  create_table "text_messages", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "track_id"
    t.text "content"
    t.string "phone_number"
    t.integer "invoice_id"
    t.text "observation"
    t.string "state"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "parent_id"
    t.integer "membership_id"
    t.integer "account_id"
    t.integer "sms_count", default: 1
    t.string "notification_type"
    t.index ["account_id"], name: "index_text_messages_on_account_id"
  end

  create_table "tokens", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "target_id"
    t.string "target_type"
    t.string "target_name"
    t.string "ref"
    t.datetime "expiration_date"
    t.boolean "can_reclaim", default: false
    t.integer "creator_membership"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "type"
    t.integer "document_id"
    t.string "email"
    t.index ["ref"], name: "index_tokens_on_ref"
  end

  create_table "traits", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "model_type"
    t.integer "model_id"
    t.string "key"
    t.string "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["model_type", "model_id", "key"], name: "index_traits_on_model_type_and_model_id_and_key"
  end

  create_table "user_accepted_terms", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", force: :cascade do |t|
    t.integer "user_id"
    t.integer "account_id"
    t.boolean "accepted_marketing"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean "terms"
  end

  create_table "user_notification_providers", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "user_notification_id"
    t.integer "provider_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_notifications", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "title"
    t.text "body"
    t.string "link"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "title_en"
    t.text "body_en"
    t.string "link_en"
  end

  create_table "users", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "login"
    t.string "email"
    t.string "crypted_password", limit: 40
    t.string "salt", limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "remember_token"
    t.datetime "remember_token_expires_at"
    t.integer "account_id"
    t.string "password_reset_code", limit: 40
    t.string "activity_stream_token"
    t.string "type"
    t.integer "old_account_id"
    t.boolean "the_system"
    t.string "api_key", limit: 40
    t.datetime "dismiss_time"
    t.string "identity_url"
    t.integer "page_items", default: 10
    t.text "first_name"
    t.text "last_name"
    t.text "phone"
    t.index ["account_id"], name: "index_users_on_account_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["login"], name: "index_users_on_login"
  end

end
