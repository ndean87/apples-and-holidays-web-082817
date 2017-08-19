require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  holiday_hash[:winter][:christmas].push(supply)
  holiday_hash[:winter][:new_years].push(supply)
end


def add_supply_to_memorial_day(holiday_hash, supply)
  holiday_hash[:spring][:memorial_day].push(supply)
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  holiday_hash[season][holiday_name] = supply_array
  return holiday_hash

end

def all_winter_holiday_supplies(holiday_hash)
  holiday_hash[:winter].values.flatten
end

def all_supplies_in_holidays(holiday_hash)
  holiday_hash.each do |season, data|
    puts "#{season.to_s.capitalize!}:"
    data.each do |holiday, supplies|
      string = "  "
      if holiday.to_s.include? "_"
        word_array = holiday.to_s.split("_")
        word_array.each do |word|
          word.capitalize!
        end
        string += "#{word_array.join(" ")}: "
      else
        string += "#{holiday.to_s.capitalize!}: "
      end
      supplies.each do |element|
        if element == supplies[-1]
          string += "#{element}"
        else
          string += "#{element}, "
        end
      end
      puts string
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  bbq_array = []
  holiday_hash.each do |season, data|
    data.each do |holiday, supplies|
      if supplies.to_s.include? "BBQ"
        bbq_array.push(holiday)
      end
    end
  end
  return bbq_array
end
