;; 1. Create a nested structure with multiple `block` and `loop` instructions. Add a `br` targeting the wrong label index, causing control to reach an `unreachable` instruction that should not execute if labels are correctly handled.

(assert_invalid
  (module
    (func $incorrect-label (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br 2) (unreachable)
          )
        )
      )
    )
  )
  "unknown label"
)