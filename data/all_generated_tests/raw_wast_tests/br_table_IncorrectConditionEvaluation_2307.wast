;; 7. **Test 7**: Define a scenario where `br_table` operates within a nested loop with explicit type expectations at each nested level. Push incorrectly typed operands and verify if `wizard_engine`’s early arity check halts execution relative to `WebAssembly`'s handling.

(assert_invalid
  (module (func $nested-types-mismatch
    (block (result i32) (loop (result i32) (i64.const 0) (br_table 0 1 (i32.const 0))))
  ))
  "type mismatch"
)