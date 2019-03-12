# == Schema Information
#
# Table name: shared_filters
#
#  id           :bigint(8)        not null, primary key
#  expires_at   :datetime
#  phrase       :text
#  context      :string
#  irreversible :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SharedFilter < ApplicationRecord
	    VALID_CONTEXTS = %w(
	            home
		            notifications
			            public
				            thread
					          ).freeze
						      
						        include Expireable

							      validates :phrase, :context, presence: true
							            validate :context_must_be_valid
								          validate :irreversible_must_be_within_context
									      
									        scope :active_irreversible, -> { where(irreversible: true).where(Arel.sql('expires_at IS NULL OR expires_at > NOW()')) }

										      before_validation :clean_up_contexts
										          
										            private
											        
											          def clean_up_contexts
													          self.context = Array(context).map(&:strip).map(&:presence).compact
														        end
												      
												        def context_must_be_valid
														        errors.add(:context, I18n.t('filters.errors.invalid_context')) if context.empty? || context.any? { |c| !VALID_CONTEXTS.include?(c) }
															      end
													    
													      def irreversible_must_be_within_context
														              errors.add(:irreversible, I18n.t('filters.errors.invalid_irreversible')) if irreversible? && !context.include?('home') && !context.include?('notifications')
															            end  
end
