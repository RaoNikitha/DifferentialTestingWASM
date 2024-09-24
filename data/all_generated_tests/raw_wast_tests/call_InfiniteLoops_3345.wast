;; 4. **Test Description**:    Define a recursive function that includes a `loop` instruction. The function should call itself under specific conditions, using proper type checking to exit. Differences should emerge if the recursion does not terminate properly and results in an infinite loop.

(assert_invalid
  (module
    (func $recursive (param i32) (result i32)
      (local.get 0)
      (i32.const 1)
      (i32.sub)
      (local.tee 0)
      (if (then
        (i32.eqz (local.get 0))
        (return (i32.const 42))
      ))
      (loop (call $recursive (i32.const 0)))
    )
  )
  "type mismatch"
)