require 'spec_helper'

describe Customer do
  it { should validate_presence_of(:customer_type) }
end
