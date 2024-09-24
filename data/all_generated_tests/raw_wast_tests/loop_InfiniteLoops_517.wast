;; 8. Set up a `loop` instruction where the entering label stack context isn't correctly extended. Validate if `WebAssembly` identifies the inconsistency using `require`, as opposed to `wizard_engine` causing an infinite loop due to context mismanagement.

(assert_invalid
  (module
    (func (param i32)
      (loop
        (i32.const 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)