;; 3. **Test Description:**    - Develop a module A that has a function performing a sequence of `nop` instructions surrounded by `call` instructions to another function within module A. Module B imports and calls this function. Inspect if function calls in module B proceed correctly, handling the return value properly.    - **Constraint Checked:** Validate `nop` handling in sequences and its impact on function calls.    - **Relation to Issue:** Tests if `nop` distorts call/return flow across modules.

(assert_invalid
  (module
    (func $callee (result i32) (nop) (i32.const 42))
    (func $caller (result i32) (call $callee) (nop) (call $callee)))
  "type mismatch"
)