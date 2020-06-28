#!/usr/bin/env python
# encoding: utf-8


def chinatax(amount, paytype="month"):
    if paytype == "month":      # else pay by year
        amount = amount * 12
    if amount < 36000:
        return amount * 0.03 -0, 0.03
    elif amount < 14.4E4:
        return amount * 0.10 - 2520, 0.10 - 2520.0 / amount
    elif amount < 30E4:
        return amount * 0.20 - 16902, 0.20 - 16902.0 / amount
    elif amount < 42E4:
        return amount * 0.25 - 31920, 0.25 - 31920.0 / amount
    elif amount < 66E4:
        return amount * 0.30 - 52920, 0.30 - 52920.0 / amount
    elif amount < 96E4:
        return amount * 0.35 - 82920, 0.35 - 82920.0 / amount
    else:
        return amount * 0.45 - 181920, 0.45 - 181920.0 / amount


def chinasecurity(amount, paytype="month"):
    # https://www.youhro.com/sb_shenzhen/
    if paytype != "month":      # else pay by year
        amount = amount / 12      # monthly

    fee = 0
    fee_company = 0

    # pension
    if amount >= 19014:
        fee += 19014 * 0.08
        fee_company += 19014 * 0.13
    else:
        fee += amount * 0.08
        fee_company += amount* 0.13

    # medicine
    if amount >= 27927:
        fee += 27927 * 0.02
        fee_company += 27927 * 0.052
    else:
        fee += amount * 0.02
        fee_company += amount* 0.052

    # house
    if amount >= 27927:
        fee += 27927 * 0.05
        fee_company += 27927 * 0.05
    else:
        fee += amount * 0.05
        fee_company += amount * 0.05

    # jobless
    fee += 2200 * 0.005

    return fee * 12, fee_company * 12


def hktax(amount, paytype="month"):
    # https://www.gov.hk/en/residents/taxes/taxfiling/taxrates/salariesrates.htm
    # https://www.gov.hk/tc/residents/taxes/salaries/allowances/allowances/7years.htm
    if paytype == "month":      # else pay by year
        amount = amount * 12

    amount_old = amount

    # basic
    amount -= 13.2E4
    # married
    amount -= 13.2E4
    # child
    # amount -= 12E4 * 1
    # parents
    amount -= (5E4 + 2.5E4)     # >60(father), 55-60(mother)

    tax = 0
    rate = [0.02, 0.06, 0.10, 0.14]
    while rate and (amount - 5E4) > 0:
        tax += 5E4 * rate.pop(0)
        amount -= 5E4
    if not rate:
        tax += amount * 0.17
    else:
        tax += amount * rate.pop(0)

    # sugar, some year
    # tax -= 2E4
    return tax, tax * 1.0 / amount_old


if __name__ == '__main__':
    # tax = cheinatax(58000)
    salary = 40000
    income = salary * (12 + 4)
    tax, rate = chinatax(income, "year")

    # fee = chinasecurity(salary*12, "year")
    fee, fee_company = chinasecurity(50000)
    print("China \n income:{:.1f}w, net-income: {:.1f}w \n tax: {:.1f}w, rate: {:.1f}%".format(income / 1E4, (income - tax) / 1E4, tax / 1E4, rate * 100))
    print("security:{:.1f}w, company:{:.1f}w".format(fee / 1E4, fee_company / 1E4))

    tax, rate = hktax(income, "year")
    print("HK \n income:{:.1f}w, net-income: {:.1f}w \n tax: {:.1f}w, rate: {:.1f}%".format(income / 1E4, (income - tax) / 1E4, tax / 1E4, rate * 100))
