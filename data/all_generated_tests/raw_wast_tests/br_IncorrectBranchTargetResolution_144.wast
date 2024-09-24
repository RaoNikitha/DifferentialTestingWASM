;; Design a scenario where multiple nested `block` structures are involved and use `br` to target a middle block incorrectly, challenging the ability to resolve labels based on the correct depth of nesting.

(assert_invalid
  (module
    (func (result i32)
      (block
        (block
          (block
            (block
              (br 3)
            )
          )
        )
      )
    )
  )
  "unknown label"
)