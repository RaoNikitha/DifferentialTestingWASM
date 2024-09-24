;; 6. **Test Unreachable at Multiple Nest Levels:** Place multiple `unreachable` instructions at different levels of nested blocks with intervening `br` commands. Ensure that encountering any `unreachable` traps effectively and no incorrect branching beyond the encountered point takes place.

(assert_invalid
  (module
    (func
      (block
        (block
          (br 1)
          (unreachable)
        )
        (block
          (br 1)
          (unreachable)
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)