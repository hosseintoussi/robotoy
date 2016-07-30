require "spec_helper"

describe Robotoy::Services::Move do
  describe ".new" do
    context "when initialized" do
      it "sets x_range and y_range" do
        robot = double(Robotoy::Robot)
        table = double(Robotoy::Table)
        move = described_class.new(robot: robot, table: table)

        expect(move.instance_variable_get("@x_range")).to eq(1)
        expect(move.instance_variable_get("@y_range")).to eq(1)
      end
    end
  end

  describe "#perform" do
    context "when prform is called on move with robot with a valid orientaiton" do
      it "calls the correct method based on robot orientation" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation).and_return(:north)
        table = double(Robotoy::Table)
        move = described_class.new(robot: robot, table: table)

        expect(move).to receive(:north)

        move.perform
      end
    end

    context "when prform is called on move with robot with an invalid orientation" do
      it "calls method_missing" do
        robot = double(Robotoy::Robot)
        allow(robot).to receive(:orientation).and_return(:invalid)
        table = double(Robotoy::Table)
        move = described_class.new(robot: robot, table: table)

        expect(move).to receive(:method_missing)

        move.perform
      end
    end
  end
end