USE InsuranceFic;
SELECT * FROM Variables;

-- Linear regression: y=(slope)x+(intercept)
-- intercept= (y mean)-(slope)*(x mean)
-- slope = sum ( (xi-x mean)(yi - y mean)) / sum (xi - x mean)^2 )

SELECT slope, intercept, 18*slope+intercept AS estimation
FROM (
	SELECT slope, 
		   y_mean_max - x_mean_max * slope AS intercept
	FROM (
		SELECT SUM((age - x_mean) * (charges - y_mean)) / SUM((age - x_mean) * (age - x_mean)) AS slope,
			   MAX(x_mean) as x_mean_max,
			   MAX(y_mean) as y_mean_max    
		FROM (
			SELECT age, AVG(age) OVER() AS x_mean,
				   charges, AVG(charges) OVER() AS y_mean
			FROM Variables) S
	) S
) S;

--

GO
CREATE FUNCTION linear_reg (
	@value FLOAT
)
RETURNS TABLE AS
RETURN
SELECT slope, intercept, @value*slope+intercept AS estimation
FROM (
	SELECT slope, 
		   y_mean_max - x_mean_max * slope AS intercept
	FROM (
		SELECT SUM((age - x_mean) * (charges - y_mean)) / SUM((age - x_mean) * (age - x_mean)) AS slope,
			   MAX(x_mean) as x_mean_max,
			   MAX(y_mean) as y_mean_max    
		FROM (
			SELECT age, AVG(age) OVER() AS x_mean,
				   charges, AVG(charges) OVER() AS y_mean
			FROM Variables) S
	) S
) S;
GO

SELECT * FROM linear_reg(18);
SELECT * FROM linear_reg(30);
SELECT * FROM linear_reg(45);
SELECT * FROM linear_reg(60);