;; 7. **Test Description:**    - Construct a module utilizing a `block` structure with nested `if-else` branches, where a `br` attempts to branch out providing differing types than what the outer `block` expects (e.g., `i64` instead of `i32`).    - **Constraint Check:** Confirms that the type on the operand stack after a `br` matches the expected result type of the surrounding `block`.    - **Differential Behavior:** WebAssembly's robust type enforcement should immediately detect and respond with an error, contrasting with potential oversight in Wizard Engine's more verbose but less rigid handling.

(assert_invalid
  (module
    (func $nested-blocks
      (block (result i32)
        (if (i32.const 1)
          (then (block (br 1 (i64.const 42)))))
        (i32.const 0)
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)