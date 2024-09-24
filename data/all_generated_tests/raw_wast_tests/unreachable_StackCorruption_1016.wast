;; 7. **Test: Arithmetic Operations Post-Unreachable**    - Insert the `unreachable` instruction followed by complex arithmetic operations like `i32.mul`, `f64.div`.    - **Stack Corruption Check:** The test ensures `unreachable` stops stack operations avoiding improper type manipulations from arithmetic instructions.

(assert_invalid
 (module (func $test-arithmetic-after-unreachable
   (unreachable) (i32.const 1) (i32.mul (i32.const 2)) 
 ))
 "type mismatch"
)