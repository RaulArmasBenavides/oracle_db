
CREATE OR REPLACE PACKAGE eureka.pkg_demo as 
 
  function suma( n1 in number, n2 in number ) return number; 
  
  function suma( n1 in number, n2 in number, n3 number ) return number; 
  
  function producto( n1 in number, n2 in number ) return number; 
 
END pkg_demo;
/

CREATE OR REPLACE PACKAGE BODY eureka.pkg_demo as 
 
  function suma( n1 in number, n2 in number ) return number 
  as 
    rtn number; 
  begin 
    rtn := n1 + n2; 
    return rtn; 
  end; 
  
  function suma( n1 in number, n2 in number, n3 number ) return number 
  as 
    rtn number; 
  begin 
    rtn := n1 + n2 + n3; 
    return rtn; 
  end; 
  
  function producto( n1 in number, n2 in number ) return number 
  as 
    rtn number; 
  begin 
    rtn := n1 * n2; 
    return rtn; 
  end; 
 
END pkg_demo; 
/

select 
  eureka.pkg_demo.suma(6,4) SUMA,
  eureka.pkg_demo.suma(6,4,7) SUMA2,
  eureka.pkg_demo.producto(6,4) PRODUCTO
from dual;

