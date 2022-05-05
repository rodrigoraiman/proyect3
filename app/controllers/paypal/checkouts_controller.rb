class Paypal: :CheckoutsController < ApplicationController
    include PayPal::SDK::REST

    def create
        payment = Payment.new({
        intent: 'sale',
        payer:{
            payment_method: 'paypal'
        },
        redirect_urls: {
            return_url: complete_oaypal_checkouts_url,
            cancel_url: line_items_url
        },
        translations: [
            {
                amount: {
                    total: current_cart.total, 
                    current: 'CLP'
                },
                description: 'Pago de productos',
                item_list: {
                    items: current_cart.line_items.map(&:to_paypal)

                }
            }
        ]
    })
    end

end