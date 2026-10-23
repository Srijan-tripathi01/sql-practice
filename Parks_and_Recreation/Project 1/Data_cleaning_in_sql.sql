-- Data Cleaning

select *
from layoffs;

-- 1. REMOVE DUPLICATES
-- 2. STANDARDIZE THE DATA
-- 3. NULL VALUE OR BLANK VALUE
-- 4. REMOVE ANY COULUMNS (IF NECCESSARY)


-- 1 Removing Duplicates

CREATE TABLE Layoff_staging
like layoffs;

select * 
from layoff_staging;


Insert layoff_staging
Select * 
from layoffs;

with duplicate_cte as(
select *, 
row_number() over(
partition by company, location, industry , total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_staging
)
select * 
from duplicate_cte
where row_num > 1;	


CREATE TABLE `layoff_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


select *
from layoff_staging2;

insert into layoff_staging2
select *, 
row_number() over(
partition by company, location, industry , total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoff_staging;


select *
from layoff_staging2
where row_num > 1;


Delete 
from layoff_staging2
where row_num > 1;
