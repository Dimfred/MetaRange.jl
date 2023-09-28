@testset "Initialization" begin
    @testset "randomize!()" begin
        Random.seed!(10)
        @testset "standard deviation" begin
            @test MetaRange.randomize!(10.0, 0.0) == 10.0
            @test MetaRange.randomize!(10.0, 0.0001) ≈ 10.0 rtol = 1e-4
            m = fill(10.0, (10, 10))
            @test MetaRange.randomize!(m, 0.0) == fill(10.0, (10, 10))
            @test MetaRange.randomize!(m, 0.1) != fill(10.0, (10, 10))
        end
        @testset "zero" begin
            @test MetaRange.randomize!(0.0, 0.1) == 0.0
            m = zeros(Float64, 10, 10)
            @test MetaRange.randomize!(m, 0.0) == zeros(Float64, 10, 10)
            @test MetaRange.randomize!(m, 0.1) == zeros(Float64, 10, 10)
        end
        @testset "missing values" begin
            @test MetaRange.randomize!(missing, 0.2) === missing
        end
        @testset "NaNs" begin
            @test MetaRange.randomize!(NaN, 0.2) === NaN #return NaNs when read in for
        end
    end
    @testset "ParamCalibration" begin
        @test MetaRange.ParamCalibration(0.0, 1.0, 1.0, 297.0, 0.65) == 0
        #test that if exponent == 1.0 mass has no effect
        p = MetaRange.ParamCalibration(1.0, 1.0, 1.0, 297.0, 0.65)
        @test p == MetaRange.ParamCalibration(1.0, 10.0, 1.0, 297.0, 0.65)
    end
end
