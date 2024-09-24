;; 8. Examine an infinite loop with a nested `br_if` instruction where each nested block's stack height changes irregularly. If `wizard_engine` mismanages its side-table entries for these conditions, it might loop forever.

(assert_invalid
  (module
    (func $infinite_loop_nested_br_if
      (loop
        (block
          (block
            (br_if 1 (i32.const 1))
            (i32.const 0)
          )
          (loop
            (block
              (br_if 1 (i32.const 0))
              (br_if 1 (i32.const 1))
            )
          )
        )
      )
    )
  )
  "stack overflow or improper stack management"
)