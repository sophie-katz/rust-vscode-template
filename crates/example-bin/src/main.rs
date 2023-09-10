use example_lib::is_tested;
use rand::Rng;

fn generate_random_vector(size: usize) -> Vec<i32> {
    let mut rng = rand::thread_rng();
    let mut vec = Vec::with_capacity(size);

    for _ in 0..size {
        vec.push(rng.gen_range(0..100));
    }

    vec
}

fn create_and_sort_random_vector(size: usize) -> Vec<i32> {
    let mut vec = generate_random_vector(size);

    vec.sort();

    vec
}

fn main() {
    let x = is_tested();

    println!("{}", x);

    let vec = create_and_sort_random_vector(1_000_000);

    println!("sorted {} elements", vec.len());
}
