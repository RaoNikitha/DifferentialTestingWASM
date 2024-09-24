;; **Test 3: Exceeding Stack Height on Return**  Develop a function that returns after excessive stack operations, possibly exceeding designated stack height limits. Insert unnecessary values and operations before the return instruction to see how each implementation handles excessive stack height. WebAssembly must unwind the stack to the entry level, while the Wizard Engine should correctly identify and manage stack limits through the popE method.  _Checks for CFG’s handling of excessive stack height and stack overflow issues on return._

(assert_invalid
 (module
   (func $exceeding-stack-height-on-return (param i32) (result i32)
     i32.const 10
     i32.const 20
     i32.add
     i32.const 30
     local.get 0
     i32.const 40
     i32.add
     return
   )
 )
 "type mismatch"
)