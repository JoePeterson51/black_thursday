require 'simplecov'
SimpleCov.start
require './lib/sales_engine'
require './lib/transaction_repository'
require './lib/transaction'

RSpec.describe Transaction do
 
  describe '#initialize' do
    it 'exists' do
      mock_transaction_repo = instance_double('TransactionRepository')
      transaction = Transaction.new({
                                      id: '263395617 ',
                                      invoice_id: '456789',
                                      credit_card_number: '4297222479999999',
                                      credit_card_expiration_date: '2016-01-11 11:51:37 UTC',
                                      result: 'success',
                                      created_at: '2016-01-11 11:51:37 UTC',
                                      updated_at: '1993-09-29 11:56:40 UTC'
                                    },
                                    mock_transaction_repo
                                   )
    
      expect(transaction).to be_instance_of(Transaction)
    end
  
    it 'has attributes' do
        mock_transaction_repo = instance_double('TransactionRepository')
        transaction = Transaction.new({
                                        id: '263395617 ',
                                        invoice_id: '456789',
                                        credit_card_number: '4297222479999999',
                                        credit_card_expiration_date: '2016-01-11 11:51:37 UTC',
                                        result: 'success',
                                        created_at: '2016-01-11 11:51:37 UTC',
                                        updated_at: '1993-09-29 11:56:40 UTC'
                                      },
                                      mock_transaction_repo
                                     )
    
      expect(transaction.id).to eq(263395617)
      expect(transaction.invoice_id).to eq(456789)
      expect(transaction.credit_card_number).to eq(4297222479999999)
      expect(transaction.credit_card_expiration_date.year).to eq(2016)
      expect(transaction.credit_card_expiration_date).to be_instance_of(Time)
      expect(transaction.result).to eq('success')
      expect(transaction.created_at.year).to eq(2016)
      expect(transaction.created_at).to be_instance_of(Time)
      expect(transaction.updated_at.year).to eq(1993)
      expect(transaction.updated_at).to be_instance_of(Time)
    end
  end
  
#   describe '#update_time_stamp' do
#     it 'updates the updated_at timestamp' do
#       mock_invoice_repo = instance_double('InvoiceRepository')
#       invoice = Invoice.new(  {
#                                 id: '263395617',
#                                     customer_id: '456789',
#                                     merchant_id: '234567890',
#                                     status: 'pending',
#                                     created_at: '2016-01-11 11:51:37 UTC',
#                                     updated_at: '1993-09-29 11:56:40 UTC'
#                                 },
#                                 mock_invoice_repo)
#       invoice.update_time_stamp
     
#       expect(invoice.updated_at.year).to eq(2021)
#     end
#   end
  
#   describe '#day_created' do
#     it 'shows day of week that invoice was created' do
#       mock_invoice_repo = instance_double('InvoiceRepository')
#       invoice = Invoice.new(  {
#                                 id: '263395617',
#                                 customer_id: '456789',
#                                 merchant_id: '234567890',
#                                 status: 'pending',
#                                 created_at: '2016-01-11 11:51:37 UTC',
#                                 updated_at: '1993-09-29 11:56:40 UTC'
#                               },
#                                 mock_invoice_repo)
#       invoice.day_created
    
#       expect(invoice.day_created).to eq('Monday')
#     end
#   end
end
