;; 6. **Recursive Function with Loop and Branch:**    - Description: Implement a recursive function containing a loop with a `br` instruction for backward branching. Ensure the recursion terminates with the correct return value.    - Constraint: This test checks the handling of recursive calls and backward branches, ensuring the correctness of the operand stack and return values.

(assert_invalid
  (module
    (func $recursive (param i32) (result i32)
      (local i32)
      (local.set 1 (i32.const 1))
      (block $loop
        (loop $inner
          (local.get 0)
          (i32.eqz)
          (br_if $loop)
          (local.get 0)
          (i32.const 1)
          (i32.sub)
          (call $recursive)
          (br $inner)
        )
      )
      (local.get 1)
    )
  )
  "type mismatch"
)