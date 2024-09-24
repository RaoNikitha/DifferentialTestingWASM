;; 10. **Test Description:**    A loop that calls a function to modify a global variable's type, but the function type returns a different sort in another block. This investigates how global variable type modifications interact with loop and function calls.  Each test is designed to probe the robustness of type checking and handling of functions within loops, looking for any discrepancies in how WebAssembly and wizard_engine manage function signatures and returns, especially when embedded within loop constructs.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global
      (global.set $g (i64.const 42))) ;; Expected i32 but got i64
    (func
      (loop
        (call $modify_global)
        (global.get $g) ;; Now should be an i32
      )
    )
  )
  "type mismatch"
)