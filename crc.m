%First, define variables for the message and polynomial divisor. Use unsigned 32-bit integers so that
extra bits are available for the remainder.
message = 0b1101100111011010u32;
messageLength = 16;
divisor = 0b1111u32;
divisorDegree = 3;
%Initialize the polynomial divisor. Use dec2bin to display the bits of the result.
divisor = bitshift(divisor,messageLength-divisorDegree-1);
dec2bin(divisor)
%Shift the divisor and message so that they have the correct number of bits (16 bits for the message and 3
bits for the remainder).
divisor = bitshift(divisor,divisorDegree);
remainder = bitshift(message,divisorDegree);
dec2bin(divisor)
dec2bin(remainder)
%Perform the division steps of the CRC using a for loop
for k = 1:messageLength
  if bitget(remainder,messageLength+divisorDegree)
    remainder = bitxor(remainder,divisor);
  end
  remainder = bitshift(remainder,1);
end
%Shift the bits of the remainder to the right to get the check value for the operation
CRC_check_value = bitshift(remainder,-messageLength);
dec2bin(CRC_check_value)
%check Message Integrity
remainder = bitshift(message,divisorDegree);
remainder = bitor(remainder,CRC_check_value);
remainder = bitset(remainder,6);
dec2bin(remainder)
%Perform the CRC division operation and then check if the result is zero
for k = 1:messageLength
  if bitget(remainder,messageLength+divisorDegree)
    remainder = bitxor(remainder,divisor);
  end
  remainder = bitshift(remainder,1);
end
if remainder == 0
  disp('Message is error free.')
else
  disp('Message contains errors.')
end
