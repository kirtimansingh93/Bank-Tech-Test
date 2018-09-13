require_relative 'bank'

class Statement

  def print_statement(transactions)
    fail 'There are no transactions to print.' if transactions.nil?

    print "date || credit || debit || balance \n"
    transactions.reverse.map do |transaction|
      print "#{transaction[:date]} || #{transaction[:credit]} || #{transaction[:debit]} || #{transaction[:balance]}\n"
    end
  end

end
