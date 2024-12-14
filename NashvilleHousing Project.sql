-- Cleaning data in SQL queries:

Select * From NashvilleHousing;


--Standardize date format:

Select SaleDate, CONVERT(date, SaleDate)
From NashvilleHousing

Alter Table NashvilleHousing
Add SaleDateConverted Date;

Update NashvilleHousing
SET SaleDateConverted = CONVERT(date, SaleDate);

Select SaleDateConverted From NashvilleHousing


--Property Address Data:

Select PropertyAddress From NashvilleHousing
--Where PropertyAddress is NULL
Order by ParcelID

Select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, 
ISNULL(a.PropertyAddress, b.PropertyAddress)
From NashvilleHousing a JOIN NashvilleHousing b
On a.ParcelID = b.ParcelID AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is NULL;

Update a
Set PropertyAddress = ISNULL(a.PropertyAddress, b.PropertyAddress)
From NashvilleHousing a JOIN NashvilleHousing b
On a.ParcelID = b.ParcelID AND a.[UniqueID ] <> b.[UniqueID ]
Where a.PropertyAddress is NULL;


-- Breaking out columns into individual columns (Address, City, State):

Select PropertyAddress
From NashvilleHousing;

Select 
SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1) as Address,
SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) as Address

From NashvilleHousing

Alter Table NashvilleHousing
Add PropertySplitAddress NVARCHAR(255);

Update NashvilleHousing
SET PropertySplitAddress = SUBSTRING(PropertyAddress, 1, CHARINDEX(',', PropertyAddress) - 1)

Alter Table NashvilleHousing
Add PropertySplitCity NVARCHAR(255);

Update NashvilleHousing
SET PropertySplitCity = SUBSTRING(PropertyAddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))

Select * From NashvilleHousing
