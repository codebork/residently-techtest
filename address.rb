#!/usr/bin/ruby

sample_data = {
    "subpremise": "Apt 6",
    "house_number": "22",
    "house_name": nil,
    "street_line_1": "Bailey Rd",
    "street_line_2": nil,
    "town_or_city": "Sale",
    "region": "Greater Manchester",
    "postcode": "M33 1AX",
}

def build_address(hash)
    address = []

    if (hash[:subpremise] or hash[:house_name])
        address << [hash[:subpremise], hash[:house_name]].compact().join(", ")
    end

    address << [hash[:house_number], hash[:street_line_1]].compact().join(" ")
    address << hash[:street_line_2] unless hash[:street_line_2].nil?
    address << hash[:town_or_city]
    address << hash[:region]
    address << hash[:postcode]

    return address.compact().join(",\n")
end

puts build_address(sample_data)
