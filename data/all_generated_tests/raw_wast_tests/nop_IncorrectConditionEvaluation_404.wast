;; 5. Insert a `nop` instruction in a loop body that dynamically evaluates a condition to break the loop with a `br_if`. Confirm that the loop exits correctly based on the condition, unaffected by the `nop`.

(assert_invalid
  (module
    (func $loop-nop (param i32) (result i32)
      (local i32)
      (local.set 0 (local.get 0))
      (loop $label
        (nop)
        (local.get 0)
        (i32.const 0)
        (i32.eq)
        (br_if $label)
        (local.get 0)
        (i32.const 1)
        (i32.sub)
        (local.set 0)
        (br $label)
      )
      (local.get 0)
    )
  )
  "type mismatch"
)