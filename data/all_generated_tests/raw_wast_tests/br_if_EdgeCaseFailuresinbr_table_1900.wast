;; 1. **Test with Label Index Just Out of Valid Range**:    Create a `br_table` instruction where the index is `ctl_stack.top`, which should trigger an out-of-bound error in wizard_engine but may result in different behavior in the WASM code due to simpler lookup logic.

(assert_invalid
  (module
    (func $label-index-out-of-bound
      (block
        (block
          (block
            (br_if 3 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)