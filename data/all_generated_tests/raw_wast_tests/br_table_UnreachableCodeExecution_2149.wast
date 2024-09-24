;; Include a sophisticated control flow involving a `br_table` where improper operand stack handling indirectly navigates to an `unreachable` instruction. This test inspects the robustness of stack management and indirect indexing logic.

(assert_invalid
  (module
    (func $sophisticated-control-flow (param i32) (result i32)
      (block (result i32)
        (block
          (br_table 0 1 (i32.const 0) (unreachable))
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)