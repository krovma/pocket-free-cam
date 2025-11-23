#include <iostream>
#include <fstream>
#include <filesystem>
#include <bitset>

using uint8 = uint8_t;
using int32 = int32_t;

uint8 Bit(uint8 const& x, uint8 bit_i) {
    return (x & (1 << bit_i)) >> bit_i;
}

uint8 buffer[128][32];

int main(int argc, char *argv[]) {
    if (argc < 2) {
        std::cout << ("No input file.\n");
        return -1;
    }

    std::filesystem::path inputFilePath = argv[1];
    if (!inputFilePath.has_filename()) {
        std::cout << ("No input file.\n");
        return 2;
    }

    std::ifstream inputFile(inputFilePath.string(), std::ios::binary);
    if (!inputFile.is_open()) {
        std::cout << ("Failed to open input file.\n");
        return 1;
    }
    auto outputFilePath = inputFilePath;
    outputFilePath.replace_filename(inputFilePath.filename().string() + ".rearranged.bin");
    std::ofstream outputFile(outputFilePath, std::ios::binary);
    if (!outputFile.is_open()) {
        std::cout << ("Failed to open output file.\n");
        return 1;
    }
    auto outputFilePath2 = inputFilePath;
    outputFilePath2.replace_filename(inputFilePath.filename().string() + ".rearranged.txt");
    std::ofstream outputFile2(outputFilePath2);
    if (!outputFile.is_open()) {
        std::cout << ("Failed to open output file.\n");
        return 1;
    }

    int32 y=0;
    int32 x=0;
    for (int32 count = 0; count < 0x1000; count += 2) {
        inputFile >> buffer[y][x];
        inputFile >> buffer[y][x + 1];
        ++y;
        if (y % 8 == 0) {
            x += 2;
            y -= 8;
            if (x % 32 == 0) {
                y += 8;
                x -= 32;
            }
        }
    }

    y = 0;
    x = 0;
    for (int32 count = 0; count < 0x1000; count += 2)
    {
        uint8 abcdefgh = buffer[y][x];
        uint8 ijklmnop = buffer[y][x + 1];
        uint8 iajbkcld =
              Bit(ijklmnop, 7) << 7
            | Bit(abcdefgh, 7) << 6
            | Bit(ijklmnop, 6) << 5
            | Bit(abcdefgh, 6) << 4
            | Bit(ijklmnop, 5) << 3
            | Bit(abcdefgh, 5) << 2
            | Bit(ijklmnop, 4) << 1
            | Bit(abcdefgh, 4);
        uint8 menfogph =
              Bit(ijklmnop, 3) << 7
            | Bit(abcdefgh, 3) << 6
            | Bit(ijklmnop, 2) << 5
            | Bit(abcdefgh, 2) << 4
            | Bit(ijklmnop, 1) << 3
            | Bit(abcdefgh, 1) << 2
            | Bit(ijklmnop, 0) << 1
            | Bit(abcdefgh, 0);
        outputFile << iajbkcld;
        outputFile << menfogph;
        outputFile2 << std::bitset<8>(iajbkcld);
        outputFile2 << std::bitset<8>(menfogph);
        x += 2;
        if (x % 32 == 0) {
            x -= 32;
            y += 1;
            outputFile2 << "\n";
        }
    }

    inputFile.close();
    outputFile.close();
    outputFile2.close();
    return 0;
}