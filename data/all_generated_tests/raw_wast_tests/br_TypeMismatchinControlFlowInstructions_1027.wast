;; 8. **Test Description:**    - Create a scenario with a `loop` nested within a `block`, where the loop expects an integer on each iteration but receives a float due to an inner `br`.    - **Constraint Check:** This test demonstrates whether the implementation identifies type mismatches in backward branches to `loops`, maintaining operand types throughout iterations.    - **Differential Behavior:** WebAssembly should detect the type inconsistency and prevent runtime errors, while Wizard Engine's handling might result in incorrect type assumptions, failing to catch the mismatch.

(assert_invalid
  (module
    (func (param f32)
      (block
        (loop (param i32)
          (br 1 (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)