module Scenario
  module Account
    class CreateForExistingUser

      attr_reader :email, :user, :account, :current_membership

      def initialize(email)
        @email = email
      end

      def create
        @user = User.find_by_login(@email)

        attributes = {
               #"first_name": "First name",
               #"last_name": "Last name",
               "organization_name": "LSP tests",
               "phone": "213456789",
               "email": @email,
               #"password": "ilovenature",
               "fiscal_id": "508025338",
               "tax_location_id": "1",
               "language": "pt",
               "currency_id": 1,
               #"terms": "1",
               #"marketing": "0"
               }

        @account = ::Account.new(attributes)

        @account.owner = @user
        #account.owner.current_account = account if account.owner.present?
        #@account.owner.password_confirmation = account.owner.password
        @account.resolve_account_name!
        @account.provider_id = 7
        #account.email = account.owner.email unless account.owner.blank?
        @account.decimal_marker = TaxLocation.find(account.tax_location_id).decimal_marker



        #account.register!
        @account.generate_account_id!

        @account.save

        @account.default_tax = @account.tax_location.taxes.first

        @account.configure_default_subscription

        @account.activate_and_setup_defaults

        @account.create_default_sequences

        # Populate StateManager-Sequence-Staging with default sequences info
        # TODO

        @user = @account.owner

        @current_membership = ::Membership.create(account: @account, user: @user)
        @current_membership.roles << ::Role.find_by_name('administrator')
        @current_membership.save!

        @current_membership.generate_api_key!
        @current_membership.save!

      end

    end

  end
end

