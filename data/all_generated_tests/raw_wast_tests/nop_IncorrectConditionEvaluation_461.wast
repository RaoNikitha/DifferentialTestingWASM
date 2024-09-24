;; 2. Create a loop construct where a counter is conditionally decremented based on a value on the stack immediately after a `nop` instruction, using `br_if` for loop continuation. Check if the incorrect condition results in different loop iteration counts.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (local.get 0)
      nop
      (loop (result i32)
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (local.get 0)
        (br_if 0)
      )
      (local.get 0)
    )
  )
  "type mismatch"
)