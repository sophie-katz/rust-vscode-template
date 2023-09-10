pub fn is_tested() -> i32 {
    5
}

pub fn is_not_tested() -> i32 {
    6
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test() {
        let x = is_tested();

        assert_eq!(x, 5);
    }
}
