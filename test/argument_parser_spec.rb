$:.unshift File.join(File.dirname(__FILE__), '..', 'lib')
require "argument_parser"

describe MavenHelperScript::ArgumentParser do
  before(:each) do
    file = File.join(File.dirname(__FILE__))
    @expectedPom = File.join(file, "pom.xml")
    @parser = MavenHelperScript::ArgumentParser.new(file)
    @expectedArgs = ' -ff -DskipTests'
  end

  it "should convert command and module then append parent pom" do
    args = Array['ci', 'p']
    result = @parser.parse(args)
    result.length.should == 1
    result[0].should == 'mvn clean install -pl parent -f ' << @expectedPom << @expectedArgs
  end


  it "should convert command, use given module, then append parent pom" do
    args = Array['ci', 'parent']
    result = @parser.parse(args)
    result.length.should == 1
    result[0].should == 'mvn clean install -pl parent -f ' << @expectedPom << @expectedArgs
  end

  it "should convert command, module, append parent pom, and apply specialty arguments" do
    args = Array['ci', 'p', '-o']
    result = @parser.parse(args)
    result.length.should == 1
    result[0].should == 'mvn clean install -pl parent -f ' << @expectedPom << @expectedArgs << " -o"
  end

  it "should convert multiple arguments" do
    args = Array['ci', 'p', 'ci', 'p']
    result = @parser.parse(args)
    result.length.should == 2
    result[0].should == 'mvn clean install -pl parent -f ' << @expectedPom << @expectedArgs
    result[1].should == 'mvn clean install -pl parent -f ' << @expectedPom << @expectedArgs
  end

  it "should convert multiple arguments and append special commands" do
    args = Array['ci', 'p', 'ci', 'p', '-o', '-blah']
    result = @parser.parse(args)
    result.length.should == 2
    expected = 'mvn clean install -pl parent -f ' << @expectedPom << @expectedArgs << " -o" << " -blah"
    result[0].should == expected
    result[1].should == expected
  end


end