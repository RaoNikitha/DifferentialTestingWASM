;; 8. **Implicit Label Use with Recursive Imports**:    - Define a block that calls an imported function which in turn calls another function from the importing module. This tests the correct handling and resolving of implicit labels considering control flow across nested functions and modules.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func))
    (func $caller (result i32)
      (block (result i32)
        call $imported_func
        (i32.const 1)
        br 0
      )
    )
    (func $imported_func
      call $caller
    )
  )
  "type mismatch"
)