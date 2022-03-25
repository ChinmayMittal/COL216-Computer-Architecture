library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use work.MyTypes.all;
use IEEE.NUMERIC_STD.ALL;


entity ConditionChecker is 
port(
	C, Z, N, V : in std_logic ;
	condition : in condtype ; 
	isTrue : out std_logic
);
end ConditionChecker ; 


architecture arch of ConditionChecker is 


begin 
process( C,Z,N,V,condition )
begin
case condition is 
when EQ => 
	isTrue <=  Z  ; 
when NE => 
	isTrue <= ( not Z ) ;
when AL => 
	isTrue <= '1' ; 
when CS => 
	isTrue <= C ; 
when CC => 
	isTrue <= ( not C ) ; 
when MI => 
	isTrue <= ( N ) ; 
when PL => 
	isTrue <= ( not N ) ; 
when VS => 
	isTrue <= ( V ) ; 
when VC => 
	isTrue <= ( not V ) ; 
when HI => 
	isTrue <= ( C and (not Z) ) ; 
when LS => 
	isTrue <= ( ( not C ) or (Z)) ; 
when GE => 
	isTrue <= (not( N xor V )) ; 
when LT => 
	isTrue <= ( N xor V ) ;
when GT => 
	isTrue <= ( ( not Z ) and (not(N xor V))) ; 
when LE => 
	isTrue <= ( (Z) or (N xor V)) ;  
when others => 
	isTrue <= '0' ; 
end case ; 
end process ; 


end arch ; 