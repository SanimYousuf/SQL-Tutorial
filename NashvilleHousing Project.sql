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


-- Same operation for owner address:

    Select OwnerAddress
    From NashvilleHousing

    Select 
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3),
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2),
    PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)
    From NashvilleHousing;

    Alter Table NashvilleHousing
    Add OwnerSplitAddress NVARCHAR(255);

    Update NashvilleHousing
    SET OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 3)

    Alter Table NashvilleHousing
    Add OwnerSplitCity NVARCHAR(255);

    Update NashvilleHousing
    SET OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 2)

    Alter Table NashvilleHousing
    Add OwnerSplitState NVARCHAR(255);

    Update NashvilleHousing
    SET OwnerSplitState = PARSENAME(REPLACE(OwnerAddress, ',', '.'), 1)

    Select * From NashvilleHousing



--Change Y and N to Yes and NO in SoldAsVacant Column:

    Select Distinct SoldAsVacant, COUNT(SoldAsVacant)
    From PortfolioProject.dbo.NashvilleHousing
    Group by SoldAsVacant
    Order by 2

    Select SoldAsVacant,
    CASE When SoldAsVacant = 'Y' Then 'Yes'
        When SoldAsVacant = 'N' Then 'No'
        ELSE SoldAsVacant
        END
    From PortfolioProject..NashvilleHousing

    UPDATE NashvilleHousing
    SET SoldAsVacant = CASE When SoldAsVacant = 'Y' Then 'Yes'
        When SoldAsVacant = 'N' Then 'No'
        ELSE SoldAsVacant
        END
    From PortfolioProject..NashvilleHousing



-- Remove Duplicates:

    With RowNumCTE As (
    Select *,
    ROW_NUMBER() OVER (
        Partition By ParcelID,
                    PropertyAddress,
                    SaleDate,
                    SalePrice,
                    LegalReference
                    ORDER BY
                        UniqueID
                        ) RowNum
    From NashvilleHousing
    --Order by ParcelID 
    )

    DELETE
    From RowNumCTE
    Where RowNum > 1
    --Order By PropertyAddress

