require 'rails/generators/active_record'

class PontiacWebhookGenerator < Rails::Generators::Base
  include Rails::Generators::Migration
  namespace 'pontiac_webhook'
  source_root File.expand_path('../templates', __FILE__)

  def copy_files
    directory 'app'
    directory 'script'
    chmod "script/delayed_job", 0755
  end

  def add_routes
    route "use_pontiac_webhook"
  end

  def update_files
    prepend_to_file "app/models/shop.rb", "require \"\#{PontiacWebhook::Engine.models_dir}/shop\" # add webhook after shop create\n"
    insert_into_file "app/models/shop.rb", "\s\shas_many :orders, dependent: :destroy\n", after: /class Shop( < ActiveRecord::Base){0,1}\n/
  end

  def install_migration
    migration_template 'db/migrate/create_delayed_jobs.rb', 'db/migrate/create_delayed_jobs.rb'
    migration_template 'db/migrate/create_orders.rb', 'db/migrate/create_orders.rb'
  end

  def show
    readme "README"
  end

  def self.next_migration_number(dirname)
    ActiveRecord::Generators::Base.next_migration_number(dirname)
  end
end
