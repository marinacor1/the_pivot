require 'rails_helper'

describe Team do
  it "can be created with one coder" do
    coder = create(:coder)
    team = Team.new({}).add_coder(coder)

    expect(team).to eq(1)
  end

  it "can add another coder" do
    coder1, coder2  = create_list(:coder, 2)

    team = Team.new({})

    team.add_coder(coder1)
    team.add_coder(coder2)

    expect(team.contents.count).to eq(2)

  end

it "can remove a coder" do
    coder1, coder2  = create_list(:coder, 2)

    team = Team.new({})

    team.add_coder(coder1.id)
    team.add_coder(coder2.id)

    expect(team.contents.count).to eq(2)

    team.remove_coder(coder2.id)

    expect(team.contents.count).to eq(1)
  end
end
