require '../chargebee'
require 'json'
require 'pp'
def test(respJson)
  resp = JSON.parse(respJson)
  resp = ChargeBee::Util.symbolize_keys(resp)
  res =  ChargeBee::Result.new(resp)
  #puts res.estimate.inspect
  #puts res.estimate.invoice_estimate.line_items[1].inspect
  puts res.estimate.credit_note_estimates[0].line_items[1].inspect
end
  
sub =  '{
    "subscription": {
        "id": "KyVrKRPHl5UT33q",
        "plan_id": "basic",
        "plan_quantity": 1,
        "status": "in_trial",
        "trial_start": 1436275944,
        "trial_end": 1438954344,
        "created_at": 1436275944,
        "started_at": 1436275944,
        "has_scheduled_changes": false,
        "object": "subscription",
        "due_invoices_count": 0
    },
    "customer": {
        "id": "KyVrKRPHl5UT33q",
        "first_name": "John",
        "last_name": "Doe",
        "email": "john@user.com",
        "phone": "+1-949-999-9999",
        "auto_collection": "on",
        "created_at": 1436275944,
        "object": "customer",
        "billing_address": {
            "first_name": "John",
            "last_name": "Doe",
            "line1": "PO Box 9999",
            "city": "Walnut",
            "state_code": "CA",
            "state": "California",
            "country": "US",
            "zip": "91789",
            "object": "billing_address"
        },
        "card_status": "no_card",
        "account_credits": 0
    },
    "invoices": [{
		"id": "1",
	    "customer_id": "8avVGOkx8U1MX",
	    "subscription_id": "8avVGOkx8U1MX",
	    "recurring": true,
	    "status": "paid",
	    "start_date": 1317407411,
	    "end_date": 1320085811,
	    "amount": 900,
	    "amount_due": 0,
	    "currency_code": "USD",
	    "paid_on": 1320085812,
	    "object": "invoice",
	    "sub_total": 900,
	    "tax": 0,
	    "line_items": [{
			"date_from": 1320085811,
            "date_to": 1322677811,
            "unit_amount": 900,
            "quantity": 1,
            "tax": 0,
            "object": "line_item",
            "amount": 900,
            "description": "Basic",
            "type": "charge",
            "entity_type": "plan",
            "entity_id": "basic"
		}],
		"linked_transactions": [{
			"txn_id": "txn_KyVr8xPHl5Bjg8",
            "applied_amount": 900,
            "txn_type": "payment",
            "txn_status": "success",
            "txn_date": 1320085812,
            "txn_amount": 900
		}],
		"linked_orders": [{
			"id": "XpbG8t4OvwWgjzM",
            "status": "processing",
            "reference_id": "1002",
            "fulfillment_status": "Awaiting Shipment",
            "created_at": 1436275881
		}],
	    "billing_address": {
	        "first_name": "Benjamin",
	        "last_name": "Ross",
	        "object": "billing_address"
	    }
	}]
}';

est =  '{"estimate": {
  "created_at": 1436275938,
	"subscription_status": "in_trial",
	"subscription_id": "gf45sajhjhga656sa",
  "subscription_next_billing_at": 1438954338,
	"object": "estimate",
	"invoice_estimate": {
		"recurring": true,
    "collect_now": false,
    "sub_otal": 500,
		"total": 900,
		"amount_due": 0,
		"object": "invoice_estimate",
    "line_items": [{
      "date_from": 1438954338,
  		"date_to": 1441632738,
  		"unit_amount": 900,
      "quantity": 1,
			"tax_amount": 0,
      "object": "line_item",
			"discount_amount": 0,
			"line_amount": 1900,
	    "description": "Basic",
			"entity_type": "plan"
    },
    {
          "date_from": 1438954338,
      		"date_to": 1441632738,
      		"unit_amount": 1000,
          "quantity": 1,
    			"tax_amount": 0,
          "object": "line_item",
    			"discount_amount": 0,
    			"line_amount": 1900,
    	    "description": "Basic",
    			"entity_type": "plan"
    }],
    "discounts": [],
		"taxes": []
  }
}}';

listEst =  '{"estimates": [{
  "created_at": 1436275938,
	"subscription_status": "in_trial",
	"subscription_id": "gf45sajhjhga656sa",
  "subscription_next_billing_at": 1438954338,
	"object": "estimate",
	"invoice_estimate": {
    "recurring": true,
    "collect_now": false,
    "sub_otal": 500,
		"total": 900,
		"amount_due": 0,
		"object": "invoice_estimate",
    "line_items": [{
      "date_from": 1438954338,
			"date_to": 1441632738,
			"unit_amount": 900,
	    "quantity": 1,
			"tax_amount": 0,
	    "object": "line_item",
			"discount_amount": 0,
			"line_amount": 1900,
	    "description": "Basic",
			"entity_type": "plan"
    }],
		"discounts": [],
		"taxes": []
	}
}]
}';

updSub = '{
  "credit_notes": [
    {
      "allocations": [],
      "credits_allocated": 0,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "id": "15",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Addon Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNMS3f",
        "item_entity_id": "addon-monthly",
        "item_entity_type": "addon",
        "line_amount": 300,
        "object": "line_item",
        "quantity": 1,
        "tax_amount": 30,
        "tax_rate": 10,
        "unit_amount": 300
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "5",
      "refundable_amount": 0,
      "refunds_made": 0,
      "remaining_credits": 330,
      "status": "payment_due",
      "sub_total": 300,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 30,
      "taxes": [{
        "amount": 30,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNNA4A",
        "object": "tax"
      }],
      "total": 330,
      "type": "customer"
    },
    {
      "allocations": [{
        "allocated_amount": 1100,
        "allocated_at": 1416076232,
        "id": "ac___dev__XpbG9YDP2wmNPx4D",
        "inv_date": 1414780583,
        "inv_id": "4",
        "inv_status": "payment_due",
        "object": "applied_credit"
      }],
      "credits_allocated": 1100,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "fully_paid_at": 1416076232,
      "id": "14",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Addon Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNMk3i",
        "item_entity_id": "addon-monthly",
        "item_entity_type": "addon",
        "line_amount": 1000,
        "object": "line_item",
        "quantity": 2,
        "tax_amount": 100,
        "tax_rate": 10,
        "unit_amount": 500
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "4",
      "refundable_amount": 0,
      "refunds_made": 0,
      "remaining_credits": 0,
      "status": "paid",
      "sub_total": 1000,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 100,
      "taxes": [{
        "amount": 100,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNNA49",
        "object": "tax"
      }],
      "total": 1100,
      "type": "invoice_due_adjustment"
    },
    {
      "allocations": [],
      "credits_allocated": 0,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "id": "13",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Plan Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNM93Z",
        "item_entity_id": "plan-monthly",
        "item_entity_type": "plan",
        "line_amount": 500,
        "object": "line_item",
        "quantity": 1,
        "tax_amount": 50,
        "tax_rate": 10,
        "unit_amount": 500
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "3",
      "refundable_amount": 550,
      "refunds_made": 0,
      "remaining_credits": 550,
      "status": "payment_due",
      "sub_total": 500,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 50,
      "taxes": [{
        "amount": 50,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNN948",
        "object": "tax"
      }],
      "total": 550,
      "type": "invoice_refundable"
    },
    {
      "allocations": [],
      "credits_allocated": 0,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "id": "12",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Addon Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNN644",
        "item_entity_id": "addon-monthly",
        "item_entity_type": "addon",
        "line_amount": 406,
        "object": "line_item",
        "quantity": 7,
        "tax_amount": 41,
        "tax_rate": 10,
        "unit_amount": 58
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "2",
      "refundable_amount": 450,
      "refunds_made": 0,
      "remaining_credits": 450,
      "status": "payment_due",
      "sub_total": 406,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 41,
      "taxes": [{
        "amount": 41,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNN745",
        "object": "tax"
      }],
      "total": 450,
      "type": "invoice_refundable"
    },
    {
      "allocations": [{
        "allocated_amount": 1050,
        "allocated_at": 1416076232,
        "id": "ac___dev__XpbG9YDP2wmNQf4I",
        "inv_date": 1416076232,
        "inv_id": "6",
        "inv_status": "paid",
        "object": "applied_credit"
      }],
      "credits_allocated": 1050,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "id": "11",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Addon Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNN43z",
        "item_entity_id": "addon-monthly",
        "item_entity_type": "addon",
        "line_amount": 1092,
        "object": "line_item",
        "quantity": 7,
        "tax_amount": 109,
        "tax_rate": 10,
        "unit_amount": 156
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "2",
      "refundable_amount": 0,
      "refunds_made": 0,
      "remaining_credits": 150,
      "status": "payment_due",
      "sub_total": 1092,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 109,
      "taxes": [{
        "amount": 109,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNN440",
        "object": "tax"
      }],
      "total": 1200,
      "type": "customer"
    },
    {
      "allocations": [{
        "allocated_amount": 2200,
        "allocated_at": 1416076232,
        "id": "ac___dev__XpbG9YDP2wmNPC4C",
        "inv_date": 1414780342,
        "inv_id": "2",
        "inv_status": "paid",
        "object": "applied_credit"
      }],
      "credits_allocated": 2200,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "fully_paid_at": 1416076232,
      "id": "10",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Addon Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNMu3l",
        "item_entity_id": "addon-monthly",
        "item_entity_type": "addon",
        "line_amount": 2002,
        "object": "line_item",
        "quantity": 7,
        "tax_amount": 200,
        "tax_rate": 10,
        "unit_amount": 286
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "2",
      "refundable_amount": 0,
      "refunds_made": 0,
      "remaining_credits": 0,
      "status": "paid",
      "sub_total": 2002,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 200,
      "taxes": [{
        "amount": 200,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNN33x",
        "object": "tax"
      }],
      "total": 2200,
      "type": "invoice_due_adjustment"
    },
    {
      "allocations": [{
        "allocated_amount": 200,
        "allocated_at": 1416076232,
        "id": "ac___dev__XpbG9YDP2wmNQZ4H",
        "inv_date": 1416076232,
        "inv_id": "6",
        "inv_status": "paid",
        "object": "applied_credit"
      }],
      "credits_allocated": 200,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "fully_paid_at": 1416076232,
      "id": "9",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Plan Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNN13t",
        "item_entity_id": "plan-monthly",
        "item_entity_type": "plan",
        "line_amount": 184,
        "object": "line_item",
        "quantity": 4,
        "tax_amount": 18,
        "tax_rate": 10,
        "unit_amount": 46
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "1",
      "refundable_amount": 0,
      "refunds_made": 0,
      "remaining_credits": 0,
      "status": "paid",
      "sub_total": 184,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 18,
      "taxes": [{
        "amount": 18,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNN13u",
        "object": "tax"
      }],
      "total": 200,
      "type": "invoice_refundable"
    },
    {
      "allocations": [{
        "allocated_amount": 1000,
        "allocated_at": 1416076232,
        "id": "ac___dev__XpbG9YDP2wmNQU4G",
        "inv_date": 1416076232,
        "inv_id": "6",
        "inv_status": "paid",
        "object": "applied_credit"
      }],
      "credits_allocated": 1000,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "fully_paid_at": 1416076232,
      "id": "8",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Plan Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNMw3o",
        "item_entity_id": "plan-monthly",
        "item_entity_type": "plan",
        "line_amount": 908,
        "object": "line_item",
        "quantity": 4,
        "tax_amount": 91,
        "tax_rate": 10,
        "unit_amount": 227
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "1",
      "refundable_amount": 0,
      "refunds_made": 0,
      "remaining_credits": 0,
      "status": "paid",
      "sub_total": 908,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 91,
      "taxes": [{
        "amount": 91,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNMw3p",
        "object": "tax"
      }],
      "total": 1000,
      "type": "customer"
    },
    {
      "allocations": [{
        "allocated_amount": 1000,
        "allocated_at": 1416076232,
        "id": "ac___dev__XpbG9YDP2wmNOH4B",
        "inv_date": 1414780220,
        "inv_id": "1",
        "inv_status": "paid",
        "object": "applied_credit"
      }],
      "credits_allocated": 1000,
      "customer_id": "testCNCreateNdApplyOrder",
      "date": 1416076232,
      "fully_paid_at": 1416076232,
      "id": "7",
      "line_items": [{
        "date_from": 1416076232,
        "date_to": 1417372220,
        "description": "Plan Monthly - Prorated Credits for 16-Nov-2014 - 01-Dec-2014",
        "discount_amount": 0,
        "id": "li___dev__XpbG9YDP2wmNMH3c",
        "item_entity_id": "plan-monthly",
        "item_entity_type": "plan",
        "line_amount": 908,
        "object": "line_item",
        "quantity": 4,
        "tax_amount": 91,
        "tax_rate": 10,
        "unit_amount": 227
      }],
      "linked_transactions": [],
      "object": "credit_note",
      "reason_code": "subscription_change",
      "reference_invoice_id": "1",
      "refundable_amount": 0,
      "refunds_made": 0,
      "remaining_credits": 0,
      "status": "paid",
      "sub_total": 908,
      "subscription_id": "testCNCreateNdApplyOrder",
      "tax_total": 91,
      "taxes": [{
        "amount": 91,
        "description": "tax @ 10%",
        "id": "li___dev__XpbG9YDP2wmNMu3m",
        "object": "tax"
      }],
      "total": 1000,
      "type": "invoice_due_adjustment"
    }
  ],
  "customer": {
    "auto_collection": "off",
    "card_status": "no_card",
    "created_at": 1414780219,
    "id": "testCNCreateNdApplyOrder",
    "object": "customer"
  },
  "invoice": {
    "amount_due": 0,
    "applied_credits": [
      {
        "applied_amount": 2000,
        "applied_at": 1416076232,
        "cn_date": 1416076224,
        "cn_id": "5",
        "cn_reason_code": "reward",
        "cn_status": "paid",
        "cn_type": "customer",
        "id": "ac___dev__XpbG9YDP2wmNQH4E",
        "object": "applied_credit"
      },
      {
        "applied_amount": 150,
        "applied_at": 1416076232,
        "cn_date": 1416076224,
        "cn_id": "6",
        "cn_reason_code": "reward",
        "cn_status": "paid",
        "cn_type": "customer",
        "id": "ac___dev__XpbG9YDP2wmNQO4F",
        "object": "applied_credit"
      },
      {
        "applied_amount": 1000,
        "applied_at": 1416076232,
        "cn_date": 1416076232,
        "cn_id": "8",
        "cn_reason_code": "subscription_change",
        "cn_status": "paid",
        "cn_type": "customer",
        "id": "ac___dev__XpbG9YDP2wmNQU4G",
        "object": "applied_credit"
      },
      {
        "applied_amount": 200,
        "applied_at": 1416076232,
        "cn_date": 1416076232,
        "cn_id": "9",
        "cn_reason_code": "subscription_change",
        "cn_status": "paid",
        "cn_type": "invoice_refundable",
        "id": "ac___dev__XpbG9YDP2wmNQZ4H",
        "object": "applied_credit"
      },
      {
        "applied_amount": 1050,
        "applied_at": 1416076232,
        "cn_date": 1416076232,
        "cn_id": "11",
        "cn_reason_code": "subscription_change",
        "cn_status": "payment_due",
        "cn_type": "customer",
        "id": "ac___dev__XpbG9YDP2wmNQf4I",
        "object": "applied_credit"
      }
    ],
    "created_credit_notes": [],
    "created_credits": 0,
    "credits_applied": 4400,
    "customer_id": "testCNCreateNdApplyOrder",
    "date": 1416076232,
    "fully_paid_at": 1416076232,
    "id": "6",
    "line_items": [{
      "date_from": 1416076232,
      "date_to": 1421346632,
      "description": "Plan 2Months",
      "discount_amount": 0,
      "id": "li___dev__XpbG9YDP2wmNLg3V",
      "item_entity_id": "plan-2months",
      "item_entity_type": "plan",
      "line_amount": 4000,
      "object": "line_item",
      "quantity": 2,
      "tax_amount": 400,
      "tax_rate": 10,
      "unit_amount": 2000
    }],
    "linked_orders": [],
    "linked_transactions": [],
    "object": "invoice",
    "payments_made": 0,
    "recurring": true,
    "refundable_amount": 200,
    "refunded_amount": 0,
    "status": "paid",
    "sub_total": 4000,
    "subscription_id": "testCNCreateNdApplyOrder",
    "tax_total": 400,
    "taxes": [{
      "amount": 400,
      "description": "tax @ 10%",
      "id": "li___dev__XpbG9YDP2wmNLi3W",
      "object": "tax"
    }],
    "total": 4400
  },
  "subscription": {
    "activated_at": 1414780220,
    "created_at": 1414780220,
    "current_term_end": 1421346632,
    "current_term_start": 1416076232,
    "due_invoices_count": 1,
    "due_since": 1414780583,
    "has_scheduled_changes": false,
    "id": "testCNCreateNdApplyOrder",
    "object": "subscription",
    "plan_id": "plan-2months",
    "plan_quantity": 2,
    "started_at": 1414780220,
    "status": "active",
    "total_dues": 1100
  }
}';


listDep =  '{"estimate": {
    "created_at": 1436275938,
	"subscription_status": "in_trial",
	"subscription_id": "gf45sajhjhga656sa",
    "subscription_next_billing_at": 1438954338,
	"object": "estimate",
	"invoice_estimates": [{
		"recurring": true,
	    "collect_now": false,
	    "sub_otal": 500,
		"total": 900,
		"amount_due": 0,
		"object": "invoice_estimate",
	    "line_items": [{
			"date_from": 1438954338,
			"date_to": 1441632738,
			"unit_amount": 900,
	        "quantity": 1,
			"tax_amount": 0,
	        "object": "line_item",
			"discount_amount": 0,
			"line_amount": 1900,
	        "description": "Basic",
			"entity_type": "plan"
		}],
		"discounts": [],
		"taxes": []
	},
	{
		"recurring": true,
	    "collect_now": false,
	    "sub_otal": 500,
		"total": 900,
		"amount_due": 0,
		"object": "invoice_estimate",
	    "line_items": [{
			"date_from": 1438954338,
			"date_to": 1441632738,
			"unit_amount": 900,
	        "quantity": 1,
			"tax_amount": 0,
	        "object": "line_item",
			"discount_amount": 0,
			"line_amount": 1900,
	        "description": "Basic",
			"entity_type": "plan"
		}],
		"discounts": [],
		"taxes": []
	}]
}}';

begin
  test(est);
end