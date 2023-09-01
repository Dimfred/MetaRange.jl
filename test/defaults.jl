@testset "defaults" begin
    @testset "get_default_ls_timeseries_config" begin
        c = MetaRange.get_default_ls_timeseries_config()
        @test c isa Dict{String,Any}
        @test c["prediction"] == 0
        @test c["change_onset"] == 0
        @test c["sd"] == 0
    end
end
