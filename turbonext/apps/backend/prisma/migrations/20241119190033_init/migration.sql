-- CreateTable
CREATE TABLE `User` (
    `userId` INTEGER NOT NULL AUTO_INCREMENT,
    `username` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `password` VARCHAR(12) NOT NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,
    `role` ENUM('ADMIN', 'USER') NOT NULL DEFAULT 'USER',

    UNIQUE INDEX `User_username_key`(`username`),
    UNIQUE INDEX `User_email_key`(`email`),
    PRIMARY KEY (`userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Manga` (
    `mal_id` INTEGER NOT NULL AUTO_INCREMENT,
    `title` VARCHAR(191) NOT NULL,
    `synopsis` VARCHAR(191) NOT NULL,
    `image_url` VARCHAR(191) NOT NULL,
    `status` ENUM('LIBRE', 'EMPRUNTE') NOT NULL DEFAULT 'LIBRE',
    `type` VARCHAR(191) NOT NULL,
    `episodes` INTEGER NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    INDEX `Manga_mal_id_idx`(`mal_id`),
    PRIMARY KEY (`mal_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Emprunt` (
    `empruntId` INTEGER NOT NULL AUTO_INCREMENT,
    `mangaId` INTEGER NOT NULL,
    `userId` INTEGER NOT NULL,
    `dateEmprunt` DATETIME(3) NOT NULL,
    `dateRetour` DATETIME(3) NULL,
    `createdAt` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `updatedAt` DATETIME(3) NOT NULL,

    UNIQUE INDEX `Emprunt_mangaId_key`(`mangaId`),
    PRIMARY KEY (`empruntId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Genre` (
    `genreId` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Genre_name_key`(`name`),
    PRIMARY KEY (`genreId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_MangaToGenre` (
    `A` INTEGER NOT NULL,
    `B` INTEGER NOT NULL,

    UNIQUE INDEX `_MangaToGenre_AB_unique`(`A`, `B`),
    INDEX `_MangaToGenre_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Emprunt` ADD CONSTRAINT `Emprunt_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Emprunt` ADD CONSTRAINT `Emprunt_mangaId_fkey` FOREIGN KEY (`mangaId`) REFERENCES `Manga`(`mal_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_MangaToGenre` ADD CONSTRAINT `_MangaToGenre_A_fkey` FOREIGN KEY (`A`) REFERENCES `Genre`(`genreId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_MangaToGenre` ADD CONSTRAINT `_MangaToGenre_B_fkey` FOREIGN KEY (`B`) REFERENCES `Manga`(`mal_id`) ON DELETE CASCADE ON UPDATE CASCADE;
