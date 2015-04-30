require "argument_parser"

describe MavenHelperScript::ArgumentParser do
  before(:each) do
    file = File.join(File.dirname(__FILE__))
    @expected_pom = File.join(file, "pom.xml")
    @parser = MavenHelperScript::ArgumentParser.new(file)
    @expected_args = ' -ff -DskipTests'
  end

  it "should convert command and module then append parent pom" do
    args = Array['ci', 'p']
    result = @parser.parse(args)
    expect(result.length).to eq 1
    expect(result[0]).to eq 'mvn clean install -pl parent -f ' << @expected_pom << @expected_args
  end


  it "should convert command, use given module, then append parent pom" do
    args = Array['ci', 'parent']
    result = @parser.parse(args)
    expect(result.length).to eq 1
    expect(result[0]).to eq 'mvn clean install -pl parent -f ' << @expected_pom << @expected_args
  end

  it "should convert command, module, append parent pom, and apply specialty arguments" do
    args = Array['ci', 'p', '-o']
    result = @parser.parse(args)
    expect(result.length).to eq 1
    expect(result[0]).to eq 'mvn clean install -pl parent -f ' << @expected_pom << @expected_args << " -o"
  end

  it "should convert multiple arguments" do
    args = Array['ci', 'p', 'ci', 'p']
    result = @parser.parse(args)
    expect(result.length).to eq 2
    expect(result[0]).to eq 'mvn clean install -pl parent -f ' << @expected_pom << @expected_args
    expect(result[1]).to eq 'mvn clean install -pl parent -f ' << @expected_pom << @expected_args
  end

  it "should convert multiple arguments and append special commands" do
    args = Array['ci', 'p', 'ci', 'p', '-o', '-blah']
    result = @parser.parse(args)
    expect(result.length).to eq 2
    expected = 'mvn clean install -pl parent -f ' << @expected_pom << @expected_args << " -o" << " -blah"
    expect(result[0]).to eq expected
    expect(result[1]).to eq expected
  end


end