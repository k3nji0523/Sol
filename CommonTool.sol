import "https://github.com/ethereum/dapp-bin/blob/master/library/stringUtils.sol"

library CommonTool {

  function getLastNumber(string str) private view returns (string)    {
        string memory firstDigitFromBehind = "";
        bool gotDigit = false;

        bytes memory strBytes = bytes(str);
        for (uint i = 0; i < bytes(str).length; i++)
        {
            string memory result = substring(str, (strBytes.length - (i+1)), strBytes.length - i);

            if (checkIsUInteger(result)) {

                return result;
                break;
            }
        }
    }
    function checkIsUInteger(string memory str) private view returns (bool)    {
        if (StringUtils.equal(str, "0")) return true;
        else if (StringUtils.equal(str, "1")) return true;
        else if (StringUtils.equal(str, "2")) return true;
        else if (StringUtils.equal(str, "3")) return true;
        else if (StringUtils.equal(str, "4")) return true;
        else if (StringUtils.equal(str, "5")) return true;
        else if (StringUtils.equal(str, "6")) return true;
        else if (StringUtils.equal(str, "7")) return true;
        else if (StringUtils.equal(str, "8")) return true;
        else if (StringUtils.equal(str, "9")) return true;
        else return false;
    }

    function getBlockHashasString(bytes32 b) private view returns (string memory) {
        return bytes32ToString(b);
    }

    function uintToAscii(uint number) private constant returns(byte) {
    if (number < 10) {
        return byte(48 + number);
    } else if (number < 16) {
        return byte(87 + number);
    } else {
        revert();
    }
    }
    function asciiToUint(byte char) private constant returns (uint) {
        uint asciiNum = uint(char);
        if (asciiNum > 47 && asciiNum < 58) {
            return asciiNum - 48;
        } else if (asciiNum > 96 && asciiNum < 103) {
            return asciiNum - 87;
        } else {
            revert();
        }
    }
    function bytes32ToString (bytes32 data) private constant returns (string) {
        bytes memory bytesString = new bytes(64);
        for (uint j=0; j < 32; j++) {
            byte char = byte(bytes32(uint(data) * 2 ** (8 * j)));
            bytesString[j*2+0] = uintToAscii(uint(char) / 16);
            bytesString[j*2+1] = uintToAscii(uint(char) % 16);
        }
            return string(bytesString);
    }
    function stringToBytes32(string str) private constant returns (bytes32) {
        bytes memory bString = bytes(str);
        uint uintString;
        if (bString.length != 64) { revert(); }
        for (uint i = 0; i < 64; i++) {
            uintString = uintString*16 + uint(asciiToUint(bString[i]));
        }
        return bytes32(uintString);
    }
    

}
