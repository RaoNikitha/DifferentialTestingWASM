;; 3. **Test Description**: Implement a function that saves a conditional value on the stack and use a `br_if` to branch based on this value. A correct evaluation should branch only if the value is true. If mis-evaluated consistently to false, the branching behavior will differ.

(assert_invalid
  (module
    (func $conditional-branch
      (local i32)
      (i32.const 1)
      (local.set 0)
      (local.get 0)
      (br_if 0 (local.get 0))
      (call 1 (local.get 0))
    )
    (func (param i32))
  )
  "type mismatch"
)